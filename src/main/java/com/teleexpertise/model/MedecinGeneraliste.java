package com.teleexpertise.model;

import com.teleexpertise.enums.Role;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;

import java.util.ArrayList;
import java.util.List;

@Entity
public class MedecinGeneraliste extends User {
    private double tarif = 150;

    @OneToMany(mappedBy = "medecinGeneraliste")
    private List<Consultation> consultations = new ArrayList<>();

    public MedecinGeneraliste(String nom, String prenom, String email, String password, Role role) {
        super(nom, prenom, email, password, role);
    }

    public MedecinGeneraliste() {

    }

    @Override
    public String getNom() {
        return super.getNom();
    }

    @Override
    public String getPrenom() {
        return super.getPrenom();
    }

    public List<Consultation> getConsultations() {
        return consultations;
    }

    public void setConsultations(List<Consultation> consultations) {
        this.consultations = consultations;
    }

    public double getTarif() {
        return tarif;
    }

    public void setTarif(double tarif) {
        this.tarif = tarif;
    }
}