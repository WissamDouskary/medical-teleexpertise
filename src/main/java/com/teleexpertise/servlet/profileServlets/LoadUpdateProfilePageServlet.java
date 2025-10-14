package com.teleexpertise.servlet.profileServlets;

import com.teleexpertise.model.MedecinSpecialiste;
import com.teleexpertise.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/profile")
public class LoadUpdateProfilePageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MedecinSpecialiste ms = (MedecinSpecialiste) req.getSession().getAttribute("user");

        req.setAttribute("specialiste", ms);
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }
}
