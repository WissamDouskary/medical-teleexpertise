package com.teleexpertise;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.Patient;
import com.teleexpertise.model.SigneVital;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.time.LocalDate;

public class MedicalApp {
    public static void main(String[] args) {
        Session session = Dbconnection.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        try {
            Patient patient = new Patient();
            patient.setNom("Wissam");
            patient.setPrenom("Si");
            patient.setDateNaissance(LocalDate.of(2000, 9, 8));
            patient.setNumSecuriteSociale("AB123456");
            patient.setAdresse("Agadir");
            patient.setTelephone("0612345678");

            SigneVital sv = new SigneVital();
            sv.setTensionArterielle(12.5);
            sv.setFrequenceCardiaque(80);
            sv.setTemperature(37.2);
            sv.setFrequenceRespiratoire(16);
            sv.setPoids(70);
            sv.setTaille(1.75);
            sv.setPatient(patient);

            patient.getSignesVitaux().add(sv);
            session.persist(patient);

            tx.commit();
            System.out.println("Patient and SigneVital saved successfully!");
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
