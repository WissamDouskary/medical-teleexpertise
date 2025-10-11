package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.ActeMedical;
import com.teleexpertise.model.Consultation;
import com.teleexpertise.model.FileAttente;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.io.File;


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

    public Consultation findById(Long id){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            Query<Consultation> consultationQuery = session.createQuery("FROM Consultation WHERE id = :id", Consultation.class);
            return consultationQuery.uniqueResult();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
