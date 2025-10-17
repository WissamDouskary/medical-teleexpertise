package com.teleexpertise.service;

import com.teleexpertise.dao.RequestDAO;
import com.teleexpertise.enums.PrioriteExpertise;
import com.teleexpertise.enums.StatutExpertise;
import com.teleexpertise.model.*;

import java.time.LocalDateTime;
import java.util.List;

public class RequestService {
    private static RequestDAO requestDAO = new RequestDAO();

    public static boolean sendRequest(Long consultationId, String priorite, Long specialisteId, String question, String creneauDateStr) {
        Consultation consultation = ConsultationService.findById(consultationId);
        MedecinSpecialiste specialiste = UserService.findSpecialisteById(specialisteId);

        if (consultation == null || specialiste == null || creneauDateStr == null || creneauDateStr.isEmpty()) {
            return false;
        }

        LocalDateTime creneauDate = LocalDateTime.parse(creneauDateStr);
        LocalDateTime creneauFin = creneauDate.plusMinutes(30);

        List<ExpertiseRequest> existingRequests = requestDAO.findAll(specialiste);
        for (ExpertiseRequest req : existingRequests) {
            LocalDateTime existingDebut = req.getCreneau().getDebut();
            LocalDateTime existingFin = req.getCreneau().getFin();

            if (creneauDate.isBefore(existingFin) && creneauFin.isAfter(existingDebut)
                    && req.getConsultation().getPatient().getId().equals(consultation.getPatient().getId())) {
                return false;
            }
        }

        List<Creneau> existingCreneaux = CreneauService.findBySpecialiste(specialiste);
        for (Creneau existing : existingCreneaux) {
            LocalDateTime debut = existing.getDebut();
            LocalDateTime fin = existing.getFin();

            boolean overlaps = !(creneauFin.isEqual(debut) || creneauDate.isEqual(fin)
                    || creneauFin.isBefore(debut) || creneauDate.isAfter(fin));
            if (overlaps) {
                return false;
            }
        }

        Creneau creneau = new Creneau();
        creneau.setDebut(creneauDate);
        creneau.setFin(creneauFin);
        creneau.setDisponible(false);
        creneau.setSpecialiste(specialiste);

        PrioriteExpertise prioriteExpertise = switch (priorite) {
            case "URGENTE" -> PrioriteExpertise.URGENTE;
            case "NORMALE" -> PrioriteExpertise.NORMALE;
            case "NON_URGENTE" -> PrioriteExpertise.NON_URGENTE;
            default -> null;
        };
        if (prioriteExpertise == null) return false;

        boolean creneauSaved = CreneauService.save(creneau);
        if (!creneauSaved) return false;

        ExpertiseRequest request = new ExpertiseRequest();
        request.setConsultation(consultation);
        request.setSpecialiste(specialiste);
        request.setPriorite(prioriteExpertise);
        request.setQuestion(question);
        request.setCreneau(creneau);
        request.setStatut(StatutExpertise.EN_ATTENTE);

        boolean requestSaved = requestDAO.save(request);
        if (!requestSaved) {
            CreneauService.delete(creneau);
            return false;
        }

        return true;
    }

    public static List<Creneau> getUnavailableCreneaux(Long specialisteId) {
        return requestDAO.findUnavailableCreneauxBySpecialiste(specialisteId);
    }

    public static boolean isAlreadySendRequest(Consultation consultation){
        return requestDAO.IsAlreadySend(consultation);
    }

    public static ExpertiseRequest findRequestById(Long id){
        return requestDAO.findById(id);
    }

    public static boolean respondRequest(Long id, StatutExpertise statutExpertise, String recommendation, String avisSpecialiste){
        return requestDAO.update(id, statutExpertise, avisSpecialiste, recommendation);
    }

    public static List<ExpertiseRequest> findAllRequests(MedecinSpecialiste specialiste){
        return requestDAO.findAll(specialiste);
    }

    public static ExpertiseRequest findByIdAndSpecialiste(Long id, MedecinSpecialiste specialiste){
        return requestDAO.findByIdAndSpecialiste(id, specialiste);
    }
}
