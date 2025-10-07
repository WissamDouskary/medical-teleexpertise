package com.teleexpertise.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class MedecinSpecialiste extends User {

    private String specialite;
    private double tarif;

    @OneToMany(mappedBy = "specialiste")
    private List<ExpertiseRequest> expertises = new ArrayList<>();
}
