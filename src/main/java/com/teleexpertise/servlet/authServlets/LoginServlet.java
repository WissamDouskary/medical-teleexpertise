package com.teleexpertise.servlet.authServlets;

import com.teleexpertise.enums.Role;
import com.teleexpertise.model.User;
import com.teleexpertise.service.LoginService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private LoginService loginService = new LoginService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            User user = loginService.authenticate(email, password);

            if (user == null) {
                req.setAttribute("error", "Invalid email or password");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
                return;
            }

            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("user", user);

            if (user.getRole().equals(Role.INFIRMIER)) {
                resp.sendRedirect("addPatient.jsp");
            } else if(user.getRole().equals(Role.GENERALISTE)){
                resp.sendRedirect("patients");
            } else if(user.getRole().equals(Role.SPECIALISTE)){
                resp.sendRedirect("requests");
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "An error occurred. Please try again.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}