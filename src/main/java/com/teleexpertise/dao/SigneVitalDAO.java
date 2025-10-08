package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.Patient;
import com.teleexpertise.model.SigneVital;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class SigneVitalDAO {
    public boolean saveSigneVital(Patient patient, SigneVital signeVital){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            patient.getSignesVitaux().add(signeVital);
            session.persist(signeVital);
            tx.commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
