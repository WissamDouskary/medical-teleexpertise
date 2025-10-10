package com.teleexpertise.service;

import com.teleexpertise.dao.PatientDAO;
import com.teleexpertise.model.Patient;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public static Map<Patient, String> findAll(){
        List<Patient> patients = patientDAO.findAll();
        Map<Patient, String> patientStringMap = new HashMap<>();

        for(Patient p : patients){
            if(patientDAO.isInWaitingList(p)){
                patientStringMap.put(p, "WAITING");
            }
        }
        return patientStringMap;
    }
}
