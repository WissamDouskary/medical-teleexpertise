package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.ActeMedical;
import com.teleexpertise.model.Consultation;
import com.teleexpertise.model.FileAttente;
import com.teleexpertise.model.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


public class ConsultationsDAO {
    public boolean save(Consultation consultation){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            session.persist(consultation);
            Query<FileAttente> fileAttenteQuery = session.createQuery("FROM FileAttente WHERE patient = :patient", FileAttente.class);
            fileAttenteQuery.setParameter("patient", consultation.getPatient());
            FileAttente fileAttente = fileAttenteQuery.uniqueResult();
            session.remove(fileAttente);
            tx.commit();
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public List<Consultation> findConsultationByPatientId(Patient patient) {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {
            Query<Consultation> query = session.createQuery(
                    "SELECT DISTINCT c FROM Consultation c LEFT JOIN FETCH c.acteMedicals WHERE c.patient = :patient", Consultation.class);
            query.setParameter("patient", patient);
            return query.list();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of();
        }
    }

    public Consultation findById(Long id){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            Query<Consultation> consultationQuery = session.createQuery("SELECT c FROM Consultation c LEFT JOIN c.acteMedicals LEFT JOIN c.patient WHERE c.id = :id", Consultation.class);
            consultationQuery.setParameter("id", id);
            return consultationQuery.uniqueResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
