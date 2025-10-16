package com.teleexpertise.servlet.requestServlets;

import com.teleexpertise.enums.StatutExpertise;
import com.teleexpertise.model.ExpertiseRequest;
import com.teleexpertise.model.MedecinSpecialiste;
import com.teleexpertise.service.RequestService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/view")
public class LoadViewRequestInfosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");

        if(idParam != null){
            ExpertiseRequest request = RequestService.findRequestById(Long.parseLong(idParam));
            MedecinSpecialiste medecinSpecialiste = (MedecinSpecialiste) req.getSession().getAttribute("user");

            req.setAttribute("expertiseRequest", request);
            req.setAttribute("specialiste", medecinSpecialiste);
            req.setAttribute("EN_ATTENTE", StatutExpertise.EN_ATTENTE);
            req.setAttribute("TERMINEE", StatutExpertise.TERMINEE);
            req.getRequestDispatcher("viewInfos.jsp").forward(req, resp);
        }
    }
}
