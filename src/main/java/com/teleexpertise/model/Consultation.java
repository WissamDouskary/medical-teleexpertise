package com.teleexpertise.model;

import com.teleexpertise.enums.StatutConsultation;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.*;

@Entity
public class Consultation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime dateConsultation;
    private String motif;
    private String observations;
    private String diagnostic;
    private double cout = 150.0;

    @Enumerated(EnumType.STRING)
    private StatutConsultation statut;

    @OneToMany(mappedBy = "consultation", cascade = CascadeType.ALL)
    private List<ActeMedical> acteMedicals = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "generaliste_id")
    private MedecinGeneraliste medecinGeneraliste;

    @OneToOne(mappedBy = "consultation", cascade = CascadeType.ALL)
    private ExpertiseRequest demandeExpertise;

    public Consultation(LocalDateTime dateConsultation, String motif, String observations, String diagnostic, double cout, StatutConsultation statut, List<ActeMedical> acteMedicals, Patient patient, MedecinGeneraliste medecinGeneraliste) {
        this.dateConsultation = dateConsultation;
        this.motif = motif;
        this.observations = observations;
        this.diagnostic = diagnostic;
        this.cout = cout;
        this.statut = statut;
        this.acteMedicals = acteMedicals;
        this.patient = patient;
        this.medecinGeneraliste = medecinGeneraliste;
    }

    public Consultation() {

    }

    public Long getId() {
        return id;
    }

    public LocalDateTime getDateConsultation() {
        return dateConsultation;
    }

    public void setDateConsultation(LocalDateTime dateConsultation) {
        this.dateConsultation = dateConsultation;
    }

    public String getMotif() {
        return motif;
    }

    public void setMotif(String motif) {
        this.motif = motif;
    }

    public String getObservations() {
        return observations;
    }

    public void setObservations(String observations) {
        this.observations = observations;
    }

    public String getDiagnostic() {
        return diagnostic;
    }

    public void setDiagnostic(String diagnostic) {
        this.diagnostic = diagnostic;
    }

    public double getCout() {
        return cout;
    }

    public void setCout(double cout) {
        this.cout = cout;
    }

    public StatutConsultation getStatut() {
        return statut;
    }

    public void setStatut(StatutConsultation statut) {
        this.statut = statut;
    }

    public List<ActeMedical> getActeMedicals() {
        return acteMedicals;
    }

    public void setActeMedicals(List<ActeMedical> acteMedicals) {
        this.acteMedicals = acteMedicals;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public MedecinGeneraliste getMedecinGeneraliste() {
        return medecinGeneraliste;
    }

    public void setMedecinGeneraliste(MedecinGeneraliste medecinGeneraliste) {
        this.medecinGeneraliste = medecinGeneraliste;
    }

    public ExpertiseRequest getDemandeExpertise() {
        return demandeExpertise;
    }

    public void setDemandeExpertise(ExpertiseRequest demandeExpertise) {
        this.demandeExpertise = demandeExpertise;
    }
}

