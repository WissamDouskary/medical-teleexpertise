package com.teleexpertise.service;

import com.teleexpertise.dao.UserDAO;
import com.teleexpertise.model.MedecinGeneraliste;
import com.teleexpertise.model.MedecinSpecialiste;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class UserService {
    private static UserDAO userDAO = new UserDAO();

    public static List<MedecinSpecialiste> findAllMedecinSpecialiste(){
        return userDAO.getAllMedicinesSpecialistes();
    }

    public static MedecinSpecialiste findSpecialisteById(Long id){
        return userDAO.findSpecialisteById(id);
    }

    public static boolean updateUser(double tarif, String specialite, Long speId){
        return userDAO.update(tarif, specialite, speId);
    }
}
