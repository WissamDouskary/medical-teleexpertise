package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.enums.Role;
import com.teleexpertise.model.MedecinSpecialiste;
import com.teleexpertise.model.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class UserDAO {

    public static User getByEmail(String email) {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {
            Query<User> query = session.createQuery("FROM User WHERE email = :email", User.class);
            query.setParameter("email", email);
            return query.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<MedecinSpecialiste> getAllMedicinesSpecialistes(){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Query<MedecinSpecialiste> query = session.createQuery("FROM User WHERE role = :role");
            query.setParameter("role", Role.SPECIALISTE);
            return query.list();
        }
        catch (Exception e){
            e.printStackTrace();
            return List.of();
        }
    }

    public MedecinSpecialiste findSpecialisteById(Long id){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Query<MedecinSpecialiste> query = session.createQuery("FROM User WHERE role = :role AND id = :id");
            query.setParameter("role", Role.SPECIALISTE);
            query.setParameter("id", id);
            return query.uniqueResult();
        }
        catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    public boolean update(double tarif, String specialite, Long speId){
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            MedecinSpecialiste ms = session.find(MedecinSpecialiste.class, speId);
            ms.setSpecialite(specialite);
            ms.setTarif(tarif);
            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
