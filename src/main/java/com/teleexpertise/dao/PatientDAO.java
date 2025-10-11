package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.Consultation;
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

    public List<Patient> findAll() {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {
            return session.createQuery("from Patient order by id ASC", Patient.class)
                    .stream()
                    .toList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public String getPatientStatus(Patient patient) {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {

            Query<FileAttente> attenteQuery = session.createQuery(
                    "FROM FileAttente WHERE patient = :patient", FileAttente.class);
            attenteQuery.setParameter("patient", patient);

            if (!attenteQuery.list().isEmpty()) {
                return "En attente";
            }

            Query<Consultation> consultQuery = session.createQuery(
                    "FROM Consultation WHERE patient = :patient ORDER BY dateConsultation DESC",
                    Consultation.class);
            consultQuery.setParameter("patient", patient);
            consultQuery.setMaxResults(1);

            Consultation latestConsult = consultQuery.uniqueResult();

            if (latestConsult != null) {
                switch (latestConsult.getStatut()) {
                    case TERMINEE:
                        return "Terminée";
                    case EN_COURS:
                        return "En cours";
                    case EN_ATTENTE_AVIS_SPECIALISTE:
                        return "En attente avis spécialiste";
                    default:
                        return "Inconnu";
                }
            }

            return "Aucun dossier";

        } catch (Exception e) {
            e.printStackTrace();
            return "Erreur";
        }
    }
}
