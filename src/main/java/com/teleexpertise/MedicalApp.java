package com.teleexpertise;


import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.Creneau;
import com.teleexpertise.model.MedecinSpecialiste;
import com.teleexpertise.model.User;
import com.teleexpertise.service.UserService;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.time.LocalDateTime;

public class MedicalApp {
    public static void main(String[] args) {
        try(Session session = Dbconnection.getSessionFactory().openSession()){
            Transaction tx = session.beginTransaction();
            Creneau creneau = new Creneau();
            MedecinSpecialiste user = UserService.findSpecialisteById(Long.parseLong("2"));
            creneau.setDebut(LocalDateTime.now());
            String datee = "2025-10-16T12:55:46";
            creneau.setFin(LocalDateTime.parse(datee));
            creneau.setDisponible(true);
            creneau.setSpecialiste(user);
            session.persist(creneau);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
