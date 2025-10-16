package com.teleexpertise.servlet.requestServlets;

import com.teleexpertise.model.Consultation;
import com.teleexpertise.model.Creneau;
import com.teleexpertise.model.MedecinSpecialiste;
import com.teleexpertise.service.ConsultationService;
import com.teleexpertise.service.CreneauService;
import com.teleexpertise.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/createRequest")
public class LoadCreateRequestPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String consultationIdParam = req.getParameter("consultationId");

        if (consultationIdParam != null) {
            Long id = Long.parseLong(consultationIdParam);
            Consultation consultation = ConsultationService.findById(id);
            List<MedecinSpecialiste> specialistes = UserService.findAllMedecinSpecialiste();

            req.setAttribute("consultation", consultation);
            req.setAttribute("specialistes", specialistes);

            req.getRequestDispatcher("createRequest.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("consultations");
        }
    }
}
