package com.teleexpertise.servlet.requestServlets;

import com.teleexpertise.model.Consultation;
import com.teleexpertise.model.MedecinSpecialiste;
import com.teleexpertise.service.ConsultationService;
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
        String ConsultationIdParam = req.getParameter("consultationId");
        List<MedecinSpecialiste> medecinSpecialisteList = UserService.findAllMedecinSpecialiste();

        if(ConsultationIdParam != null){
            Long id = Long.parseLong(ConsultationIdParam);
            Consultation consultation = ConsultationService.findById(id);
            req.setAttribute("consultation", consultation);
            req.setAttribute("specialistes", medecinSpecialisteList);
            req.getRequestDispatcher("createRequest.jsp").forward(req, resp);
        }
    }
}
