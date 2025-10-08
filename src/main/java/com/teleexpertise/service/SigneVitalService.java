package com.teleexpertise.service;

import com.teleexpertise.dao.SigneVitalDAO;
import com.teleexpertise.model.Patient;
import com.teleexpertise.model.SigneVital;

public class SigneVitalService {
    private static SigneVitalDAO signeVitalDAO = new SigneVitalDAO();

    public static boolean saveSignVital(double tensionArterielle, int frequenceCardiaque, double temperature, int frequenceRespiratoire,
                                        double poids, double taille, Patient patient){
        SigneVital signeVital = new SigneVital(tensionArterielle, frequenceCardiaque, temperature, frequenceRespiratoire, poids, taille, patient);
        return signeVitalDAO.saveSigneVital(patient, signeVital);
    }
}
