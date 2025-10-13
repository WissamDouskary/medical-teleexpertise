package com.teleexpertise.servlet;

import com.teleexpertise.model.MedecinGeneraliste;
import com.teleexpertise.service.RequestService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/createExpertiseRequest")
public class CreateRequestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("consultationId");
        String priorite = req.getParameter("priorite");
        String specialisteId = req.getParameter("specialisteId");
        String question = req.getParameter("question");

        RequestService.sendRequest(Long.parseLong(idParam), priorite, Long.parseLong(specialisteId), question);

        resp.sendRedirect("patients");
    }
}
