package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.FileAttente;
import com.teleexpertise.model.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class PatientDAO {
    public boolean savePatient(Patient patient){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            FileAttente fileAttente = new FileAttente(patient);
            session.persist(fileAttente);
            session.persist(patient);
            tx.commit();
            session.close();
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public Patient findPatientByNumSociale(String numSocial){
        Patient patient = null;
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            Query<Patient> patientQuery = session.createQuery("FROM Patient WHERE numSecuriteSociale = :numSecuriteSociale", Patient.class);
            patientQuery.setParameter("numSecuriteSociale", numSocial);
            patient = patientQuery.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            patient = null;
        }
        return patient;
    }

    public Patient findbyId(Long id){
        Patient patient = null;
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            Query<Patient> patientQuery = session.createQuery("FROM Patient WHERE id = :id", Patient.class);
            patientQuery.setParameter("id", id);
            patient = patientQuery.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            patient = null;
        }
        return patient;
    }
}
