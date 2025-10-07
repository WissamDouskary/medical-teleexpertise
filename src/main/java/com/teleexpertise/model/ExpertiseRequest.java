package com.teleexpertise.model;

import com.teleexpertise.enums.PrioriteExpertise;
import com.teleexpertise.enums.StatutExpertise;
import jakarta.persistence.*;

@Entity
public class ExpertiseRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String question;
    private String avisSpecialiste;
    private String recommandations;

    @Enumerated(EnumType.STRING)
    private StatutExpertise statut;
    @Enumerated(EnumType.STRING)
    private PrioriteExpertise priorite;

    @OneToOne
    @JoinColumn(name = "consultation_id")
    private Consultation consultation;

    @ManyToOne
    @JoinColumn(name = "specialiste_id")
    private MedecinSpecialiste specialiste;
}
