package com.teleexpertise.dao;

import com.teleexpertise.config.Dbconnection;
import com.teleexpertise.model.ActeMedical;
import com.teleexpertise.model.Consultation;
import com.teleexpertise.service.ConsultationService;
import org.hibernate.Session;

public class ActeMedicalDAO {
    public boolean save(Consultation consultation, String[] libelle, double[] cout) {
        try (Session session = Dbconnection.getSessionFactory().openSession()) {
            session.beginTransaction();

            for (int i = 0; i < libelle.length; i++) {
                ActeMedical acteMedical = new ActeMedical();
                acteMedical.setConsultation(consultation);
                acteMedical.setPrice(cout[i]);
                acteMedical.setType(libelle[i]);
                session.persist(acteMedical);
            }

            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
