package com.teleexpertise.model;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;

import java.util.ArrayList;
import java.util.List;

@Entity
public class MedecinGeneraliste extends User {

    @OneToMany(mappedBy = "medecinGeneraliste")
    private List<Consultation> consultations = new ArrayList<>();
}