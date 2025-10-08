package com.teleexpertise.servlet;

import com.teleexpertise.dao.UserDAO;
import com.teleexpertise.enums.Role;
import com.teleexpertise.model.User;
import com.teleexpertise.service.LoginService;
import com.teleexpertise.util.passwordUtil;
import jakarta.persistence.NoResultException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.postgresql.util.PasswordUtil;

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
            } else {
                resp.sendRedirect("dashboard.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "An error occurred. Please try again.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}