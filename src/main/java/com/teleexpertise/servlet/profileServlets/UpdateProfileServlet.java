package com.teleexpertise.servlet.profileServlets;

import com.teleexpertise.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editprofile")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String specialite = req.getParameter("specialite");
        Long id = Long.parseLong(req.getParameter("specialisteId"));
        double tarif = Double.parseDouble(req.getParameter("tarif"));

        if (UserService.updateUser(tarif, specialite, id)) {
            req.getSession().setAttribute("successMessage", "Médecine modifiée avec succès !");
        } else {
            req.getSession().setAttribute("errorMessage", "Erreur durant la modification !");
        }

        resp.sendRedirect(req.getContextPath() + "/profile");
    }
}
