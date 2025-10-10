package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.FileAttente;
import com.teleexpertise.model.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;


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

    public List<Patient> findAll(){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            return session.createQuery("from Patient", Patient.class).stream().toList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public boolean isInWaitingList(Patient patient) {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();

            Query<FileAttente> query = session.createQuery(
                    "FROM FileAttente WHERE patient = :patient",
                    FileAttente.class
            );
            query.setParameter("patient", patient);

            boolean isFound = !query.list().isEmpty();

            tx.commit();
            return isFound;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
