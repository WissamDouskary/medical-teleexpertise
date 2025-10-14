package com.teleexpertise.service;

import com.teleexpertise.dao.RequestDAO;
import com.teleexpertise.enums.PrioriteExpertise;
import com.teleexpertise.enums.StatutExpertise;
import com.teleexpertise.model.Consultation;
import com.teleexpertise.model.ExpertiseRequest;
import com.teleexpertise.model.MedecinGeneraliste;
import com.teleexpertise.model.MedecinSpecialiste;

import java.util.List;

public class RequestService {
    private static RequestDAO requestDAO = new RequestDAO();

    public static boolean sendRequest(Long ConsultationId, String priorite, Long specialisteId, String question){
        Consultation consultation = ConsultationService.findById(ConsultationId);
        MedecinSpecialiste specialiste = UserService.findSpecialisteById(specialisteId);

        PrioriteExpertise prioriteExpertise = null;
        if(priorite.equals("URGENTE")){
            prioriteExpertise = PrioriteExpertise.URGENTE;
        }else if(priorite.equals("NORMALE")){
            prioriteExpertise = PrioriteExpertise.NORMALE;
        }else if(priorite.equals("NON_URGENTE")){
            prioriteExpertise = PrioriteExpertise.NON_URGENTE;
        }

        if(prioriteExpertise == null){
            return false;
        }

        ExpertiseRequest expertiseRequest = new ExpertiseRequest();
        expertiseRequest.setConsultation(consultation);
        expertiseRequest.setSpecialiste(specialiste);
        expertiseRequest.setPriorite(prioriteExpertise);
        expertiseRequest.setQuestion(question);
        expertiseRequest.setStatut(StatutExpertise.EN_ATTENTE);

        return requestDAO.save(expertiseRequest);
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
