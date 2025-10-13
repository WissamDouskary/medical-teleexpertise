package com.teleexpertise.servlet.patientServlets;

import com.teleexpertise.model.Patient;
import com.teleexpertise.service.PatientService;
import com.teleexpertise.service.SigneVitalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/addPatient")
public class AddPatientServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String nom = req.getParameter("nom");
            String prenom = req.getParameter("prenom");
            LocalDate dateNaissance = LocalDate.parse(req.getParameter("dateNaissance"));
            String numSecuriteSociale = req.getParameter("numSecuriteSociale");
            String telephone = req.getParameter("telephone");
            String adresse = req.getParameter("adresse");


            double tensionArterielle = Double.parseDouble(req.getParameter("tensionArterielle"));
            int frequenceCardiaque = Integer.parseInt(req.getParameter("frequenceCardiaque"));
            double temperature = Double.parseDouble(req.getParameter("temperature"));
            int frequenceRespiratoire = Integer.parseInt(req.getParameter("frequenceRespiratoire"));
            double poids = Double.parseDouble(req.getParameter("poids"));
            double taille = Double.parseDouble(req.getParameter("taille"));

            Patient patient = PatientService.savePatient(nom, prenom, dateNaissance, numSecuriteSociale, adresse, telephone);
            boolean isInserted = SigneVitalService.saveSignVital(tensionArterielle, frequenceCardiaque, temperature, frequenceRespiratoire, poids, taille, patient);

            if (isInserted) {
                req.getSession().setAttribute("sucess", "Patient ajouté avec succès!");
                resp.sendRedirect("addPatient.jsp");
            }else{
                req.getSession().setAttribute("error", "Error en patient ajouter avec succes!");
                req.getRequestDispatcher("addPatient.jsp");
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
