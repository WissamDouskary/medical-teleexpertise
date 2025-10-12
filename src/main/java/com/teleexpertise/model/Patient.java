package com.teleexpertise.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Patient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;
    private String prenom;
    private LocalDate dateNaissance;
    private String numSecuriteSociale;
    private String adresse;
    private String telephone;
    private LocalDate addingIn;

    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SigneVital> signesVitaux = new ArrayList<>();

    @OneToMany(mappedBy = "patient", cascade = CascadeType.ALL)
    private List<Consultation> consultations = new ArrayList<>();

    public Patient(String nom, String prenom, LocalDate dateNaissance, String numSecuriteSociale, String adresse, String telephone) {
        this.nom = nom;
        this.prenom = prenom;
        this.dateNaissance = dateNaissance;
        this.numSecuriteSociale = numSecuriteSociale;
        this.adresse = adresse;
        this.telephone = telephone;
        this.addingIn = LocalDate.now();
        this.signesVitaux = signesVitaux;
        this.consultations = consultations;
    }

    public Patient() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public LocalDate getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(LocalDate dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getNumSecuriteSociale() {
        return numSecuriteSociale;
    }

    public void setNumSecuriteSociale(String numSecuriteSociale) {
        this.numSecuriteSociale = numSecuriteSociale;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public List<SigneVital> getSignesVitaux() {
        return signesVitaux;
    }

    public void setSignesVitaux(List<SigneVital> signesVitaux) {
        this.signesVitaux = signesVitaux;
    }

    public List<Consultation> getConsultations() {
        return consultations;
    }

    public void setConsultations(List<Consultation> consultations) {
        this.consultations = consultations;
    }

    public LocalDate getAddingIn() {
        return addingIn;
    }

    public void setAddingIn(LocalDate addingIn) {
        this.addingIn = addingIn;
    }

    @Override
    public String toString() {
        return "Patient {" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", dateNaissance=" + dateNaissance +
                ", numSecuriteSociale='" + numSecuriteSociale + '\'' +
                ", adresse='" + adresse + '\'' +
                ", telephone='" + telephone + '\'' +
                ", nombreSignesVitaux=" + (signesVitaux != null ? signesVitaux.size() : 0) +
                ", nombreConsultations=" + (consultations != null ? consultations.size() : 0) +
                '}';
    }
}
