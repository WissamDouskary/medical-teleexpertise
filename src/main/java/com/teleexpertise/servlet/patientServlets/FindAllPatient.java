package com.teleexpertise.servlet.patientServlets;

import com.teleexpertise.model.Patient;
import com.teleexpertise.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.Map;

@WebServlet("/patients")
public class FindAllPatient extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String filterStatus = req.getParameter("status");
        Map<Patient, String> patients = PatientService.findAll();

        if(filterStatus != null && filterStatus.equals("Today")){
            Map<Patient, String> filtered = new LinkedHashMap<>();
            LocalDate today = LocalDate.now();
            for(Map.Entry<Patient, String> entry : patients.entrySet()){
                Patient pa = entry.getKey();
                if(pa.getAddingIn().equals(today)){
                    filtered.put(pa, entry.getValue());
                }
            }
            patients = filtered;
        }

        if (filterStatus != null && !filterStatus.isEmpty() && !filterStatus.equals("Tous") && !filterStatus.equals("Today")) {
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
