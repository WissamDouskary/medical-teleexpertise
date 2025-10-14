package com.teleexpertise.servlet.requestServlets;

import com.teleexpertise.model.ExpertiseRequest;
import com.teleexpertise.model.MedecinSpecialiste;
import com.teleexpertise.service.RequestService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/respondExpertiseRequest")
public class LoadRespondeRequestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MedecinSpecialiste medecinSpecialiste = (MedecinSpecialiste) req.getSession().getAttribute("user");
        String id = req.getParameter("id");
        ExpertiseRequest requestList = RequestService.findByIdAndSpecialiste(Long.parseLong(id), medecinSpecialiste);

        req.setAttribute("expertiseRequest", requestList);

        req.getRequestDispatcher("respondeRequest.jsp").forward(req, resp);
    }
}
