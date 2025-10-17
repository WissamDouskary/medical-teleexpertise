package com.teleexpertise.servlet.patientServlets;

import com.teleexpertise.model.Consultation;
import com.teleexpertise.model.Patient;
import com.teleexpertise.model.SigneVital;
import com.teleexpertise.service.ConsultationService;
import com.teleexpertise.service.PatientService;
import com.teleexpertise.service.RequestService;
import com.teleexpertise.service.SigneVitalService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/viewPatient")
public class LoadPatientByIdInformations extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        Map<Long, Boolean> isSendMap = new HashMap<>();

        if (idParam != null) {
            Long id = Long.parseLong(idParam);
            Patient patient = PatientService.findById(id);

            if(patient == null){
                req.getRequestDispatcher("patients").forward(req, resp);
            }

            SigneVital signeVital = SigneVitalService.findSignVitalByPatientId(patient);
            List<Consultation> consultationList = ConsultationService.findByPatientId(patient);

            for(Consultation c : consultationList){
                boolean isSend = RequestService.isAlreadySendRequest(c);
                isSendMap.put(c.getId(), isSend);
            }

            req.setAttribute("isSendMap", isSendMap);
            req.setAttribute("patient", patient);
            req.setAttribute("signes", signeVital);
            req.setAttribute("consultations", consultationList);
            req.getRequestDispatcher("patientInfos.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("patients");
        }
    }
}
