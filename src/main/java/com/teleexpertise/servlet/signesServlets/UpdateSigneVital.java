package com.teleexpertise.servlet.signesServlets;

import com.teleexpertise.model.Patient;
import com.teleexpertise.service.PatientService;
import com.teleexpertise.service.SigneVitalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updateSignes")
public class UpdateSigneVital extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        double tensionArterielle = Double.parseDouble(req.getParameter("tensionArterielle"));
        int frequenceCardiaque = Integer.parseInt(req.getParameter("frequenceCardiaque"));
        double temperature = Double.parseDouble(req.getParameter("temperature"));
        int frequenceRespiratoire = Integer.parseInt(req.getParameter("frequenceRespiratoire"));
        double poids = Double.parseDouble(req.getParameter("poids"));
        double taille = Double.parseDouble(req.getParameter("taille"));

        Long patient_id = Long.parseLong(req.getParameter("patient_id"));

        Patient patient = PatientService.findById(patient_id);
        boolean isUpdated = SigneVitalService.updateSignVital(tensionArterielle, frequenceCardiaque, temperature, frequenceRespiratoire, poids, taille, patient);

        if (isUpdated) {
            req.setAttribute("sucess", "Signes Vitaux modifier avec succes!");
            req.getRequestDispatcher("userFound.jsp").forward(req, resp);
        } else {
            req.getSession().setAttribute("error", "Error en modification de signes vitaux!");
            req.getRequestDispatcher("userFound.jsp");
        }
    }
}
