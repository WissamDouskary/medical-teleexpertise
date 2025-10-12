package com.teleexpertise.service;

import com.teleexpertise.dao.ConsultationsDAO;
import com.teleexpertise.enums.StatutConsultation;
import com.teleexpertise.model.Consultation;
import com.teleexpertise.model.MedecinGeneraliste;
import com.teleexpertise.model.Patient;

import java.time.LocalDateTime;
import java.util.List;

public class ConsultationService {
    private static ConsultationsDAO consultationsDAO = new ConsultationsDAO();

    public static Consultation saveConsultation(LocalDateTime dateConsultation, String motif, String observations,
                                                String diagnostic, double cout, StatutConsultation statut, MedecinGeneraliste medecinGeneraliste, Patient patient) {
        Consultation consultation = new Consultation();
        consultation.setDateConsultation(dateConsultation);
        consultation.setMotif(motif);
        consultation.setObservations(observations);
        consultation.setDiagnostic(diagnostic);
        consultation.setCout(cout);
        consultation.setStatut(statut);
        consultation.setPatient(patient);
        consultation.setMedecinGeneraliste(medecinGeneraliste);

        boolean saved = consultationsDAO.save(consultation);

        return saved ? consultation : null;
    }

    public static Consultation findById(Long id){
        return consultationsDAO.findById(id);
    }

    public static List<Consultation> findByPatientId(Patient patient){
        return consultationsDAO.findConsultationByPatientId(patient);
    }
}
