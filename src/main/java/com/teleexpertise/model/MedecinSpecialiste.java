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

    public String getSpecialite() {
        return specialite;
    }

    public void setSpecialite(String specialite) {
        this.specialite = specialite;
    }

    public double getTarif() {
        return tarif;
    }

    public void setTarif(double tarif) {
        this.tarif = tarif;
    }

    public List<ExpertiseRequest> getExpertises() {
        return expertises;
    }

    public void setExpertises(List<ExpertiseRequest> expertises) {
        this.expertises = expertises;
    }
}
