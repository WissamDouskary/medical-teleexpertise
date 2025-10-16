package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.Creneau;
import com.teleexpertise.model.MedecinSpecialiste;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.time.LocalDateTime;
import java.util.List;

public class CreneauDAO {

    public List<Creneau> findAvailableBySpecialiste(MedecinSpecialiste specialiste) {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {
            Query<Creneau> query = session.createQuery(
                    "FROM Creneau WHERE specialiste = :specialiste AND disponible = true ORDER BY debut, fin",
                    Creneau.class
            );
            query.setParameter("specialiste", specialiste);
            return query.list();
        }
    }

    public Creneau findByDateAndSpecialiste(LocalDateTime date, MedecinSpecialiste specialiste) {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {
            return session.createQuery(
                            "FROM Creneau c WHERE c.specialiste = :spec AND c.debut = :date", Creneau.class)
                    .setParameter("spec", specialiste)
                    .setParameter("date", date)
                    .uniqueResult();
        }
    }

    public void save(Creneau creneau) {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            session.persist(creneau);
            tx.commit();
        }
    }

    public List<Creneau> findBySpecialiste(MedecinSpecialiste specialiste) {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {
            return session.createQuery("FROM Creneau c WHERE c.specialiste = :specialiste", Creneau.class)
                    .setParameter("specialiste", specialiste)
                    .list();
        }
    }

    public void markAsUnavailable(Creneau creneau) {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            creneau.setDisponible(false);
            session.merge(creneau);
            tx.commit();
        }
    }

    public Creneau findById(Long id){
        try (Session session = Dbconnection.getSessionFactory().openSession()){
            return session.find(Creneau.class, id);
        }
    }
}
