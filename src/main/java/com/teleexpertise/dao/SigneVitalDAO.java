package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.Patient;
import com.teleexpertise.model.SigneVital;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class SigneVitalDAO {
    public boolean saveSigneVital(Patient patient, SigneVital signeVital){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            patient.getSignesVitaux().add(signeVital);
            session.persist(signeVital);
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateSignVital(SigneVital signeVital){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            session.merge(signeVital);
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public SigneVital findSignVitalByPatientId(Patient Patient){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            Query<SigneVital> signeVitalQuery = session.createQuery("FROM SigneVital WHERE patient = :patient", SigneVital.class);
            signeVitalQuery.setParameter("patient", Patient);
            return signeVitalQuery.uniqueResult();
        }
        catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
