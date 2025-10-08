package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.FileAttente;
import com.teleexpertise.model.Patient;
import org.hibernate.Session;
import org.hibernate.Transaction;

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
}
