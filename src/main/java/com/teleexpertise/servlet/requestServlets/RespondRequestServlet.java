package com.teleexpertise.servlet.requestServlets;

import com.teleexpertise.enums.StatutExpertise;
import com.teleexpertise.service.RequestService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/respond")
public class RespondRequestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("requestId");
        String avisSpecialiste = req.getParameter("avisSpecialiste");
        String recommandations = req.getParameter("recommandations");
        String statut = req.getParameter("statut");

        StatutExpertise statutExpertise = null;

        if(statut.equals("EN_ATTENTE")){
            statutExpertise = StatutExpertise.EN_ATTENTE;
        }else if (statut.equals("TERMINEE")){
            statutExpertise = StatutExpertise.TERMINEE;
        }

        if(statutExpertise == null){
            return;
        }

        HttpSession session = req.getSession();

        if(RequestService.respondRequest(Long.parseLong(idParam), statutExpertise, recommandations, avisSpecialiste)){
            session.setAttribute("successMessage", "Rependre a request avec succes");
        }else{
            session.setAttribute("errorMessage", "error en repondre a generaliste request");
        }

        resp.sendRedirect("requests");
    }
}