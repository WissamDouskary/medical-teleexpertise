package com.teleexpertise.servlet;

import com.teleexpertise.model.Patient;
import com.teleexpertise.model.SigneVital;
import com.teleexpertise.service.PatientService;
import com.teleexpertise.service.SigneVitalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/viewPatient")
public class LoadPatientByIdInformations extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam != null) {
            Long id = Long.parseLong(idParam);
            Patient patient = PatientService.findById(id);
            if(patient == null){
                req.getRequestDispatcher("patients").forward(req, resp);
            }
            SigneVital signeVital = SigneVitalService.findSignVitalByPatientId(patient);

            req.setAttribute("patient", patient);
            req.setAttribute("signes", signeVital);
            req.getRequestDispatcher("patientInfos.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("patients");
        }
    }
}
