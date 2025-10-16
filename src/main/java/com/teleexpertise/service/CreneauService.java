package com.teleexpertise.service;

import com.teleexpertise.dao.CreneauDAO;
import com.teleexpertise.model.Creneau;
import com.teleexpertise.model.MedecinSpecialiste;

import java.time.LocalDateTime;
import java.util.List;

public class CreneauService {
    private static CreneauDAO creneauDAO = new CreneauDAO();

    public static Creneau findById(Long id){
        return creneauDAO.findById(id);
    }

    public static List<Creneau> findBySpecialiste(MedecinSpecialiste specialiste) {
        return creneauDAO.findBySpecialiste(specialiste);
    }

    public static void save(Creneau creneau) {
        creneauDAO.save(creneau);
    }
}
