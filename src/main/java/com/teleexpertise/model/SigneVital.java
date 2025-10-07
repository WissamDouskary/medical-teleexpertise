package com.teleexpertise.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "signe_vital")
public class SigneVital {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private double tensionArterielle;
    private int frequenceCardiaque;
    private double temperature;
    private int frequenceRespiratoire;
    private double poids;
    private double taille;
    private LocalDateTime dateMesure;

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    public SigneVital() {}

    public SigneVital(double tensionArterielle, int frequenceCardiaque, double temperature, int frequenceRespiratoire,
                      double poids, double taille, Patient patient) {
        this.tensionArterielle = tensionArterielle;
        this.frequenceCardiaque = frequenceCardiaque;
        this.temperature = temperature;
        this.frequenceRespiratoire = frequenceRespiratoire;
        this.poids = poids;
        this.taille = taille;
        this.dateMesure = LocalDateTime.now();
        this.patient = patient;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public double getTensionArterielle() { return tensionArterielle; }
    public void setTensionArterielle(double tensionArterielle) { this.tensionArterielle = tensionArterielle; }

    public int getFrequenceCardiaque() { return frequenceCardiaque; }
    public void setFrequenceCardiaque(int frequenceCardiaque) { this.frequenceCardiaque = frequenceCardiaque; }

    public double getTemperature() { return temperature; }
    public void setTemperature(double temperature) { this.temperature = temperature; }

    public int getFrequenceRespiratoire() { return frequenceRespiratoire; }
    public void setFrequenceRespiratoire(int frequenceRespiratoire) { this.frequenceRespiratoire = frequenceRespiratoire; }

    public double getPoids() { return poids; }
    public void setPoids(double poids) { this.poids = poids; }

    public double getTaille() { return taille; }
    public void setTaille(double taille) { this.taille = taille; }

    public LocalDateTime getDateMesure() { return dateMesure; }
    public void setDateMesure(LocalDateTime dateMesure) { this.dateMesure = dateMesure; }

    public Patient getPatient() { return patient; }
    public void setPatient(Patient patient) { this.patient = patient; }
}
