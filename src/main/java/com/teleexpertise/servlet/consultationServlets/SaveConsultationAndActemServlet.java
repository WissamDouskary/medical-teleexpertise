package com.teleexpertise.servlet.consultationServlets;

import com.teleexpertise.enums.StatutConsultation;
import com.teleexpertise.model.Consultation;
import com.teleexpertise.model.MedecinGeneraliste;
import com.teleexpertise.model.Patient;
import com.teleexpertise.service.ActeMedicalService;
import com.teleexpertise.service.ConsultationService;
import com.teleexpertise.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;
@WebServlet("/saveConsultation")
public class SaveConsultationAndActemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        LocalDateTime dateConsultation = LocalDateTime.parse(req.getParameter("dateConsultation"));
        String motif = req.getParameter("motif");
        String observations = req.getParameter("observations");
        String diagnostic = req.getParameter("diagnostic");
        double cout = Double.parseDouble(req.getParameter("cout"));
        String statutParam = req.getParameter("statut");

        StatutConsultation statutConsultation = null;
        switch (statutParam) {
            case "EN_COURS" -> statutConsultation = StatutConsultation.EN_COURS;
            case "TERMINEE" -> statutConsultation = StatutConsultation.TERMINEE;
            case "EN_ATTENTE_AVIS_SPECIALISTE" -> statutConsultation = StatutConsultation.EN_ATTENTE_AVIS_SPECIALISTE;
        }

        String[] libelle = req.getParameterValues("libelle[]");
        String[] coutActeStrs = req.getParameterValues("coutActe[]");

        double[] coutActe = Arrays.stream(coutActeStrs)
                .mapToDouble(Double::parseDouble)
                .toArray();

        HttpSession httpSession = req.getSession();
        MedecinGeneraliste medecinGeneraliste = (MedecinGeneraliste) httpSession.getAttribute("user");
        String id = req.getParameter("patientId");
        Patient patient = PatientService.findById(Long.parseLong(id));

        Consultation consultation = ConsultationService.saveConsultation(
                dateConsultation, motif, observations, diagnostic, cout, statutConsultation, medecinGeneraliste, patient
        );

        if (consultation != null) {
            ActeMedicalService.saveActeMedicals(consultation, libelle, coutActe);
        }

        if (statutConsultation.equals(StatutConsultation.EN_ATTENTE_AVIS_SPECIALISTE) && consultation != null) {
            resp.sendRedirect("http://localhost:3000/medical_teleexpertise/createRequest?consultationId=" + consultation.getId());
            return;
        }

        resp.sendRedirect("patients");
    }
}