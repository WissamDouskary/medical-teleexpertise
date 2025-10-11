package com.teleexpertise.servlet;

import com.teleexpertise.model.Patient;
import com.teleexpertise.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/patients")
public class FindAllPatient extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String filterStatus = req.getParameter("status");
        Map<Patient, String> patients = PatientService.findAll();

        if (filterStatus != null && !filterStatus.isEmpty() && !filterStatus.equals("Tous")) {
            Map<Patient, String> filtered = new LinkedHashMap<>();
            for (Map.Entry<Patient, String> entry : patients.entrySet()) {
                if (entry.getValue().equalsIgnoreCase(filterStatus)) {
                    filtered.put(entry.getKey(), entry.getValue());
                }
            }
            patients = filtered;
        }

        req.setAttribute("patients", patients);
        req.setAttribute("patientCount", patients.size());
        req.setAttribute("selectedStatus", filterStatus != null ? filterStatus : "Tous");
        req.getRequestDispatcher("patients.jsp").forward(req, resp);
    }
}
