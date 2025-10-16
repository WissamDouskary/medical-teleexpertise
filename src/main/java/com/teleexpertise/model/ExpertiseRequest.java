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

    @ManyToOne
    @JoinColumn(name = "creneau_id")
    private Creneau creneau;

    public Creneau getCreneau() {
        return creneau;
    }

    public void setCreneau(Creneau creneau) {
        this.creneau = creneau;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAvisSpecialiste() {
        return avisSpecialiste;
    }

    public void setAvisSpecialiste(String avisSpecialiste) {
        this.avisSpecialiste = avisSpecialiste;
    }

    public String getRecommandations() {
        return recommandations;
    }

    public void setRecommandations(String recommandations) {
        this.recommandations = recommandations;
    }

    public StatutExpertise getStatut() {
        return statut;
    }

    public void setStatut(StatutExpertise statut) {
        this.statut = statut;
    }

    public PrioriteExpertise getPriorite() {
        return priorite;
    }

    public void setPriorite(PrioriteExpertise priorite) {
        this.priorite = priorite;
    }

    public Consultation getConsultation() {
        return consultation;
    }

    public void setConsultation(Consultation consultation) {
        this.consultation = consultation;
    }

    public MedecinSpecialiste getSpecialiste() {
        return specialiste;
    }

    public void setSpecialiste(MedecinSpecialiste specialiste) {
        this.specialiste = specialiste;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
