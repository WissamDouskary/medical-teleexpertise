package com.teleexpertise.service;

import com.teleexpertise.dao.PatientDAO;
import com.teleexpertise.model.Patient;

import java.time.LocalDate;

public class PatientService {

    private static PatientDAO patientDAO = new PatientDAO();

    public static Patient savePatient(String nom, String prenom, LocalDate dateNaissance, String numSecuriteSociale, String adresse, String telephone){
        Patient patient = new Patient(nom, prenom, dateNaissance, numSecuriteSociale, adresse, telephone);

        patientDAO.savePatient(patient);

        return patient;
    }

    public static Patient findPatientByNumSocial(String numSocial){
        Patient patient = patientDAO.findPatientByNumSociale(numSocial);
        if(patient == null){
            return null;
        }
        return patient;
    }

    public static Patient findById(Long id){
        Patient patient = patientDAO.findbyId(id);
        if(patient == null){
            return null;
        }
        return patient;
    }
}
