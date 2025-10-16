package com.teleexpertise.servlet.requestServlets;

import com.teleexpertise.service.RequestService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/createExpertiseRequest")
public class CreateRequestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Long consultationId = Long.parseLong(req.getParameter("consultationId"));
        Long specialisteId = Long.parseLong(req.getParameter("specialisteId"));
        String creneauDateStr = req.getParameter("creneauDate");
        String question = req.getParameter("question");
        String priorite = req.getParameter("priorite");

        boolean success = RequestService.sendRequest(
                consultationId, priorite ,  specialisteId, question , creneauDateStr
        );

        HttpSession session = req.getSession();

        if (success) {
            session.setAttribute("success", "request envoyé avec succes!");
            resp.sendRedirect("createRequest?consultationId="+consultationId);
        } else {
            session.setAttribute("error", "Le Creneau tu choisi est ne pas disponible essayer une autre date que : "+creneauDateStr );
            resp.sendRedirect("createRequest?consultationId="+consultationId);
        }
    }
}
