package com.teleexpertise.model;

import jakarta.persistence.*;

@Entity
public class ActeMedical {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private double price;
    private String type;

    @ManyToOne
    @JoinColumn(name = "consultation_id")
    private Consultation consultation;

    public ActeMedical(double price, String type, Consultation consultation) {
        this.price = price;
        this.type = type;
        this.consultation = consultation;
    }

    public ActeMedical() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Consultation getConsultation() {
        return consultation;
    }

    public void setConsultation(Consultation consultation) {
        this.consultation = consultation;
    }
}
