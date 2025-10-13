package com.teleexpertise.servlet.patientServlets;

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

@WebServlet("/searchPatient")
public class SearchPatientServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String numSocial = req.getParameter("numSecuriteSociale");

        Patient patient = PatientService.findPatientByNumSocial(numSocial);

        if(patient == null){
            req.setAttribute("isFound", false);
            req.setAttribute("error", "Aucun utilisateur sauvegardé avec ce numéro social");
            req.getRequestDispatcher("userFound.jsp").forward(req, resp);
            return;
        }

        SigneVital signeVital = SigneVitalService.findSignVitalByPatientId(patient);

        req.setAttribute("patient", patient);
        req.setAttribute("signVitaux", signeVital);
        req.setAttribute("isFound", true);
        req.setAttribute("succes", "Utilisateur trouvé!");
        req.getRequestDispatcher("userFound.jsp").forward(req, resp);
    }
}
