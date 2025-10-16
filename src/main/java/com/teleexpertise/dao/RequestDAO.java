package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.enums.StatutExpertise;
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

    public boolean update(Long id, StatutExpertise statutExpertise, String avisSpecialiste, String recommendation){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            ExpertiseRequest request = session.find(ExpertiseRequest.class, id);
            request.setStatut(statutExpertise);
            request.setAvisSpecialiste(avisSpecialiste);
            request.setRecommandations(recommendation);
            session.persist(request);
            tx.commit();
            return true;
        }
        catch (Exception e){
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

    public ExpertiseRequest findById(Long id){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Query<ExpertiseRequest> query = session.createQuery("SELECT r FROM ExpertiseRequest r LEFT JOIN FETCH r.consultation c LEFT JOIN FETCH c.patient LEFT JOIN FETCH c.medecinGeneraliste LEFT JOIN FETCH r.specialiste LEFT JOIN FETCH c.acteMedicals WHERE r.id = :id", ExpertiseRequest.class);
            query.setParameter("id", id);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ExpertiseRequest findByIdAndSpecialiste(Long id, MedecinSpecialiste specialiste){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Query<ExpertiseRequest> query = session.createQuery("SELECT r FROM ExpertiseRequest r LEFT JOIN FETCH r.consultation c LEFT JOIN FETCH c.patient LEFT JOIN FETCH c.medecinGeneraliste LEFT JOIN FETCH r.specialiste WHERE r.specialiste = :specialiste AND r.id = :id", ExpertiseRequest.class);
            query.setParameter("specialiste", specialiste);
            query.setParameter("id", id);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
