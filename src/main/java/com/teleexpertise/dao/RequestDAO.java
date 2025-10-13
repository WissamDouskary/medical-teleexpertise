package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.ExpertiseRequest;
import com.teleexpertise.model.MedecinSpecialiste;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

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

    public List<ExpertiseRequest> findAll(MedecinSpecialiste specialiste){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Query<ExpertiseRequest> expertiseRequestQuery = session.createQuery(
                    "SELECT DISTINCT r FROM ExpertiseRequest r " +
                            "LEFT JOIN FETCH r.consultation c " +
                            "LEFT JOIN FETCH c.patient " +
                            "LEFT JOIN FETCH c.medecinGeneraliste " +
                            "LEFT JOIN FETCH r.specialiste " +
                            "WHERE r.specialiste = :specialiste",
                    ExpertiseRequest.class
            );
            expertiseRequestQuery.setParameter("specialiste", specialiste);
            return expertiseRequestQuery.list();
        }
        catch (Exception e){
            e.printStackTrace();
            return List.of();
        }
    }
}
