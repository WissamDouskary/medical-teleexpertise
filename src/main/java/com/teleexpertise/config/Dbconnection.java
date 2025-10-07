package com.teleexpertise.config;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class Dbconnection {
    private static SessionFactory sessionFactory;

    static {
        try{
            sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        }
        catch (Exception e){
            System.out.println("Error while connecting database : " + e.getMessage());
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}