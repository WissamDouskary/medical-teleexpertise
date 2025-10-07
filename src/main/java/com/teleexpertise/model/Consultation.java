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

    @ManyToOne
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "generaliste_id")
    private MedecinGeneraliste medecinGeneraliste;

    @OneToOne(mappedBy = "consultation", cascade = CascadeType.ALL)
    private ExpertiseRequest demandeExpertise;
}

