package com.teleexpertise.service;

import com.teleexpertise.dao.UserDAO;
import com.teleexpertise.model.MedecinSpecialiste;

import java.util.List;

public class UserService {
    private static UserDAO userDAO = new UserDAO();

    public static List<MedecinSpecialiste> findAllMedecinSpecialiste(){
        return userDAO.getAllMedicinesSpecialistes();
    }

    public static MedecinSpecialiste findSpecialisteById(Long id){
        return userDAO.findSpecialisteById(id);
    }
}
