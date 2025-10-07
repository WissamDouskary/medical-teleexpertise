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
}
