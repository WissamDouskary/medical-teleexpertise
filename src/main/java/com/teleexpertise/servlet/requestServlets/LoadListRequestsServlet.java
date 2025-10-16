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
        String statut = req.getParameter("status") == null ? "Tous" : req.getParameter("status");

        List<ExpertiseRequest> requests = RequestService.findAllRequests(ms);
        int enAttentSize = (int) requests.stream().filter(r -> r.getStatut().equals(StatutExpertise.EN_ATTENTE)).count();
        int urgentSize = (int) requests.stream().filter(r -> r.getPriorite().equals(PrioriteExpertise.URGENTE)).count();
        int CompletedSize = (int) requests.stream().filter(r -> r.getStatut().equals(StatutExpertise.TERMINEE)).count();

        StatutExpertise statutExpertise;

        if (statut.equals("EN_ATTENTE")) {
            statutExpertise = StatutExpertise.EN_ATTENTE;
        } else if (statut.equals("TERMINEE")) {
            statutExpertise = StatutExpertise.TERMINEE;
        } else {
            statutExpertise = null;
        }

        if (!statut.equals("Tous") && statutExpertise != null) {
            requests = requests.stream().filter(a -> a.getStatut().equals(statutExpertise)).toList();
        }

        req.setAttribute("selectedStatus", statut != null ? statut : "Tous");
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
