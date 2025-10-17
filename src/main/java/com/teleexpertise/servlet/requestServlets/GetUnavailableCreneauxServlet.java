package com.teleexpertise.servlet.requestServlets;

import com.teleexpertise.model.Creneau;
import com.teleexpertise.service.RequestService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/getUnavailableCreneaux")
public class GetUnavailableCreneauxServlet extends HttpServlet {
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String specialisteIdStr = req.getParameter("specialisteId");
        if (specialisteIdStr == null || specialisteIdStr.isEmpty()) {
            resp.getWriter().write("[]");
            return;
        }

        Long specialisteId = Long.parseLong(specialisteIdStr);

        try {
            List<Creneau> creneaux = RequestService.getUnavailableCreneaux(specialisteId);

            List<Object> serialized = creneaux.stream()
                    .map(c -> new Object() {
                        public final String debut = c.getDebut().format(FORMATTER);
                        public final String fin = c.getFin().format(FORMATTER);
                    })
                    .collect(Collectors.toList());

            String json = new ObjectMapper().writeValueAsString(serialized);
            resp.getWriter().write(json);

        } catch (Exception e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"error\":\"Erreur interne du serveur\"}");
        }
    }
}
