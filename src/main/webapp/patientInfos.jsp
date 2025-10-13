<%@ page import="com.teleexpertise.model.User" %>
<%@ page import="com.teleexpertise.enums.Role" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultations du Patient - Téléexpertise Médicale</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#4A1D4A',
                        secondary: '#6B2D6B',
                        accent: '#8B4789',
                    }
                }
            }
        }
    </script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-50">
<nav class="bg-white shadow-sm border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
            <div class="flex items-center gap-8">
                <a href="index.jsp" class="flex items-center gap-2">
                    <div class="w-8 h-8 bg-primary rounded-lg flex items-center justify-center">
                        <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/>
                        </svg>
                    </div>
                    <span class="text-xl font-bold text-gray-900">MediExpert</span>
                </a>
                <a href="patients" class="text-primary font-medium hover:text-secondary transition-colors">
                    Liste des Patients
                </a>
            </div>
            <div class="flex items-center gap-4">
                <form action="logout" method="post">
                    <button type="submit" class="text-gray-600 hover:text-primary transition-colors">Logout</button>
                </form>
            </div>
        </div>
    </div>
</nav>

<main class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="mb-8">
        <div class="flex items-center gap-4 mb-4">
            <a href="patients" class="text-primary hover:text-secondary transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
                </svg>
            </a>
            <h1 class="text-3xl font-bold text-gray-900">Historique des Consultations</h1>
        </div>
        <p class="text-gray-600">Patient: <span class="font-semibold">${patient.prenom} ${patient.nom}</span> - N° ${patient.numSecuriteSociale}</p>
    </div>

    <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 mb-8">
        <div class="flex items-center justify-between">
            <div class="flex items-center gap-4">
                <div class="w-12 h-12 bg-primary/10 rounded-full flex items-center justify-center">
                    <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                    </svg>
                </div>
                <div>
                    <h2 class="text-xl font-semibold text-gray-900">${patient.prenom} ${patient.nom}</h2>
                    <p class="text-sm text-gray-600">Né(e) le ${patient.dateNaissance} • ${patient.telephone}</p>
                </div>
            </div>
            <div class="text-right">
                <p class="text-sm text-gray-500">Total Consultations</p>
                <p class="text-2xl font-bold text-primary">${consultations.size()}</p>
            </div>
        </div>
    </div>

    <div class="space-y-6">
        <c:forEach var="consultation" items="${consultations}">
            <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div class="bg-gradient-to-r from-primary to-secondary p-6">
                    <div class="flex items-center justify-between text-white">
                        <div>
                            <div class="flex items-center gap-3 mb-2">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                </svg>
                                <h3 class="text-xl font-semibold">Consultation #${consultation.id}</h3>
                            </div>
                            <p class="text-white/90">
                                    ${consultation.dateConsultation}
                            </p>
                            <c:if test="${consultation.statut.name() == 'EN_ATTENTE_AVIS_SPECIALISTE'}">
                            <a class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium underline text-white font-bold mt-4" href="${pageContext.request.contextPath}/createRequest?consultationId=${consultation.id}">Request Specialiste</a>
                            </c:if>
                        </div>
                        <div class="text-right">
                            <c:choose>
                                <c:when test="${consultation.statut.name() == 'TERMINEE'}">
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                                        Terminée
                                    </span>
                                </c:when>
                                <c:when test="${consultation.statut.name() == 'EN_COURS'}">
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-100 text-blue-800">
                                        En cours
                                    </span>
                                </c:when>
                                <c:when test="${consultation.statut.name() == 'EN_ATTENTE_AVIS_SPECIALISTE'}">
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-yellow-100 text-yellow-800">
                                        En Attente Avis Specialist
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-red-100 text-red-800">
                                        Annulée
                                    </span>
                                </c:otherwise>
                            </c:choose>
                            <p class="text-white/90 text-sm mt-2">Coût: ${consultation.cout} DH</p>
                        </div>
                    </div>
                </div>

                <div class="p-6">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-500 mb-1">Médecin Généraliste</label>
                            <p class="text-base font-semibold text-gray-900">
                                Dr. ${consultation.medecinGeneraliste.prenom} ${consultation.medecinGeneraliste.nom}
                            </p>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-500 mb-1">Motif de Consultation</label>
                            <p class="text-base font-semibold text-gray-900">${consultation.motif}</p>
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-gray-500 mb-1">Observations</label>
                            <p class="text-base text-gray-900 bg-gray-50 p-4 rounded-lg">${consultation.observations}</p>
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-gray-500 mb-1">Diagnostic</label>
                            <p class="text-base text-gray-900 bg-gray-50 p-4 rounded-lg">${consultation.diagnostic}</p>
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-gray-500 mb-1">Doctor</label>
                            <p class="text-lg font-bold text-primary text-gray-900 bg-gray-50 p-4 rounded-lg ">${consultation.medecinGeneraliste.tarif} DH</p>
                        </div>
                    </div>

                    <c:if test="${not empty consultation.acteMedicals}">
                        <div class="border-t border-gray-200 pt-6">
                            <div class="flex items-center gap-2 mb-4">
                                <svg class="w-5 h-5 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                                </svg>
                                <h4 class="text-lg font-semibold text-gray-900">Actes Médicaux</h4>
                                <span class="text-sm text-gray-500">(${consultation.acteMedicals.size()} acte(s))</span>
                            </div>

                            <div class="space-y-3">
                                <c:forEach var="acte" items="${consultation.acteMedicals}">
                                    <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg border border-gray-200">
                                        <div class="flex items-center gap-3">
                                            <div class="w-10 h-10 bg-primary/10 rounded-lg flex items-center justify-center">
                                                <svg class="w-5 h-5 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                          d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                                </svg>
                                            </div>
                                            <div>
                                                <p class="font-semibold text-gray-900">${acte.type}</p>
                                                <p class="text-sm text-gray-500">Acte médical #${acte.id}</p>
                                            </div>
                                        </div>
                                        <div class="text-right">
                                            <p class="text-lg font-bold text-primary">${acte.price} DH</p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="mt-4 p-4 bg-primary/5 rounded-lg border border-primary/20">
                                <div class="flex items-center justify-between">
                                    <span class="text-sm font-medium text-gray-700">Coût total des actes médicaux</span>
                                    <span class="text-xl font-bold text-primary">
                                        <c:set var="totalActes" value="0"/>
                                        <c:forEach var="acte" items="${consultation.acteMedicals}">
                                            <c:set var="totalActes" value="${totalActes + acte.price}"/>
                                        </c:forEach>
                                        ${totalActes + consultation.medecinGeneraliste.tarif} DH
                                    </span>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${empty consultation.acteMedicals}">
                        <div class="border-t border-gray-200 pt-6">
                            <div class="text-center py-8 text-gray-500">
                                <svg class="w-12 h-12 mx-auto mb-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                </svg>
                                <p>Aucun acte médical enregistré pour cette consultation</p>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty consultations}">
            <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-12 text-center">
                <svg class="w-16 h-16 mx-auto mb-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                </svg>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Aucune consultation</h3>
                <p class="text-gray-600">Ce patient n'a pas encore de consultations enregistrées.</p>
            </div>
        </c:if>
    </div>

    <div class="flex flex-col sm:flex-row gap-4 justify-between mt-8">
        <a
                href="patients"
                class="px-6 py-3 border border-gray-300 rounded-lg text-gray-700 font-medium hover:bg-gray-50 transition-colors text-center"
        >
            ← Retour à la liste des patients
        </a>
        <a
                href="consultPatient?id=${patient.id}"
                class="px-6 py-3 bg-primary rounded-lg text-white font-medium hover:bg-secondary transition-colors text-center"
        >
            + Nouvelle consultation
        </a>
    </div>
</main>

<footer class="bg-white border-t border-gray-200 mt-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div class="text-center text-gray-600 text-sm">
            <p>&copy; 2025 MediExpert. Plateforme de téléexpertise médicale sécurisée.</p>
        </div>
    </div>
</footer>
</body>
</html>