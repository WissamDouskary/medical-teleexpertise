package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.ExpertiseRequest;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RequestDAO {
    public boolean save(ExpertiseRequest expertiseRequest){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            session.persist(expertiseRequest);
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
