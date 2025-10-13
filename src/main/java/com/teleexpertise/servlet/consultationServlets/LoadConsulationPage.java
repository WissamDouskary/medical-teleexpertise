package com.teleexpertise.servlet.consultationServlets;

import com.teleexpertise.model.Patient;
import com.teleexpertise.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/consultPatient")
public class LoadConsulationPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if(idParam != null){
            Long id = Long.parseLong(idParam);
            Patient patient = PatientService.findById(id);
            req.setAttribute("patient", patient);
        }
        req.getRequestDispatcher("consultation.jsp").forward(req, resp);
    }
}
