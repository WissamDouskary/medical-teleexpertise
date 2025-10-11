package com.teleexpertise.service;

import com.teleexpertise.dao.ActeMedicalDAO;
import com.teleexpertise.model.ActeMedical;
import com.teleexpertise.model.Consultation;

public class ActeMedicalService {
    private static ActeMedicalDAO acteMedicalDAO = new ActeMedicalDAO();

    public static boolean saveActeMedicals(Consultation consultation, String[] libelle, double[] cout){
        return acteMedicalDAO.save(consultation, libelle, cout);
    }
}
