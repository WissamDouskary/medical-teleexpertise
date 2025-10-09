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

    public static SigneVital findSignVitalByPatientId(Patient patient){
        return signeVitalDAO.findSignVitalByPatientId(patient);
    }

    public static boolean updateSignVital(double tensionArterielle, int frequenceCardiaque, double temperature,
                                          int frequenceRespiratoire, double poids, double taille, Patient patient) {

        SigneVital existingSigneVital = signeVitalDAO.findSignVitalByPatientId(patient);
//
//        if (existingSigneVital == null) {
//            return signeVitalDAO.saveSigneVital(patient, new SigneVital(
//                    tensionArterielle, frequenceCardiaque, temperature,
//                    frequenceRespiratoire, poids, taille, patient
//            ));
//        }

        existingSigneVital.setTensionArterielle(tensionArterielle);
        existingSigneVital.setFrequenceCardiaque(frequenceCardiaque);
        existingSigneVital.setTemperature(temperature);
        existingSigneVital.setFrequenceRespiratoire(frequenceRespiratoire);
        existingSigneVital.setPoids(poids);
        existingSigneVital.setTaille(taille);

        return signeVitalDAO.updateSignVital(existingSigneVital);
    }
}