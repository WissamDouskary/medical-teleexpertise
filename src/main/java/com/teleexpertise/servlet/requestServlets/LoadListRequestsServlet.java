package com.teleexpertise.servlet.requestServlets;

import com.teleexpertise.enums.PrioriteExpertise;
import com.teleexpertise.enums.StatutConsultation;
import com.teleexpertise.enums.StatutExpertise;
import com.teleexpertise.model.ExpertiseRequest;
import com.teleexpertise.model.MedecinSpecialiste;
import com.teleexpertise.service.RequestService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/requests")
public class LoadListRequestsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        MedecinSpecialiste ms = (MedecinSpecialiste) session.getAttribute("user");

        List<ExpertiseRequest> requests = RequestService.findAllRequests(ms);
        double enAttentSize = requests.stream().filter(r -> r.getStatut().equals(StatutExpertise.EN_ATTENTE)).count();
        double urgentSize = requests.stream().filter(r -> r.getPriorite().equals(PrioriteExpertise.URGENTE)).count();
        double CompletedSize = requests.stream().filter(r -> r.getStatut().equals(StatutExpertise.TERMINEE)).count();

        for (ExpertiseRequest r : requests) {
            System.out.println("Patient: " + r.getConsultation().getPatient().getNom());
            System.out.println("Medecin: " + r.getConsultation().getMedecinGeneraliste());
        }

        req.setAttribute("totalRequests", requests.size());
        req.setAttribute("pendingRequests", enAttentSize);
        req.setAttribute("urgentRequests", urgentSize);
        req.setAttribute("completedRequests", CompletedSize);
        req.setAttribute("expertiseRequests", requests);
        req.setAttribute("specialiste", ms);
        req.setAttribute("STATUT_EN_ATTENTE", StatutExpertise.EN_ATTENTE);
        req.setAttribute("STATUT_TERMINEE", StatutExpertise.TERMINEE);
        req.setAttribute("STATUT_CONSULTATION_ATTENTE", StatutConsultation.EN_ATTENTE_AVIS_SPECIALISTE);

        req.getRequestDispatcher("list-requests.jsp").forward(req, resp);
    }
}
