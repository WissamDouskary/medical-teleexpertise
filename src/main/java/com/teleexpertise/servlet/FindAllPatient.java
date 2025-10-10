package com.teleexpertise.servlet;

import com.teleexpertise.model.Patient;
import com.teleexpertise.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;

@WebServlet("/patients")
public class FindAllPatient extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<Patient, String> patients = PatientService.findAll();

        req.setAttribute("patients", patients);
        req.setAttribute("patientCount", patients.size());
        req.getRequestDispatcher("patients.jsp").forward(req, resp);
    }
}
