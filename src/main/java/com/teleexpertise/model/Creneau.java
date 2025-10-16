package com.teleexpertise.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "Creneau")
public class Creneau {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDateTime debut;
    private LocalDateTime fin;
    private boolean disponible = true;

    @ManyToOne
    @JoinColumn(name = "specialiste_id")
    private MedecinSpecialiste specialiste;

    public Creneau(LocalDateTime debut, LocalDateTime fin, boolean disponible, MedecinSpecialiste specialiste) {
        this.debut = debut;
        this.fin = fin;
        this.disponible = disponible;
        this.specialiste = specialiste;
    }

    public Creneau() {};

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getDebut() {
        return debut;
    }

    public void setDebut(LocalDateTime debut) {
        this.debut = debut;
    }

    public LocalDateTime getFin() {
        return fin;
    }

    public void setFin(LocalDateTime fin) {
        this.fin = fin;
    }

    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    public MedecinSpecialiste getSpecialiste() {
        return specialiste;
    }

    public void setSpecialiste(MedecinSpecialiste specialiste) {
        this.specialiste = specialiste;
    }
}
