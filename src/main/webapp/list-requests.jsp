<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demandes d'Expertise - MediExpert</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-50">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="bg-white shadow-sm border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16">
            <div class="flex items-center gap-8">
                <a href="index.jsp" class="flex items-center gap-2">
                    <div class="w-8 h-8 bg-[#4A1D4A] rounded-lg flex items-center justify-center">
                        <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/>
                        </svg>
                    </div>
                    <span class="text-xl font-bold text-gray-900">MediExpert</span>
                </a>
                <a href="requests" class="text-[#4A1D4A] font-medium hover:text-[#6B2D6B] transition-colors">
                    Mes Demandes
                </a>
                <a href="profile" class="text-[#4A1D4A] font-medium hover:text-[#6B2D6B] transition-colors">
                    Edit Profile
                </a>
            </div>
            <div class="flex items-center gap-4">
                <span class="text-sm text-gray-600">Dr. ${specialiste.nom} ${specialiste.prenom}</span>
                <span class="px-3 py-1 bg-[#4A1D4A] text-white text-xs rounded-full">${specialiste.specialite}</span>
                <form action="logout" method="post">
                    <button type="submit" class="text-gray-600 hover:text-[#4A1D4A] transition-colors">Déconnexion
                    </button>
                </form>
            </div>
        </div>
    </div>
</nav>

<div class="max-w-7xl mx-auto px-4 py-8">
    <div class="mb-8">
        <h1 class="text-3xl font-bold text-gray-900">Demandes d'Expertise</h1>
        <p class="text-gray-600 mt-2">Gérez les demandes d'avis médical des médecins généralistes</p>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="mb-6 bg-green-50 border border-green-200 text-green-800 px-4 py-3 rounded-lg flex items-center">
            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                      d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z"
                      clip-rule="evenodd"/>
            </svg>
                ${successMessage}
        </div>
        <c:remove var="successMessage" scope="session"/>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="mb-6 bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-lg flex items-center">
            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd"
                      d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"
                      clip-rule="evenodd"/>
            </svg>
                ${errorMessage}
        </div>
        <c:remove var="errorMessage" scope="session"/>
    </c:if>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
        <div class="bg-white rounded-lg shadow-md p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-600">Total</p>
                    <p class="text-2xl font-bold text-gray-900">${totalRequests}</p>
                </div>
                <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                </div>
            </div>
        </div>

        <div class="bg-white rounded-lg shadow-md p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-600">En Attente</p>
                    <p class="text-2xl font-bold text-orange-600">${pendingRequests}</p>
                </div>
                <div class="w-12 h-12 bg-orange-100 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
            </div>
        </div>

        <div class="bg-white rounded-lg shadow-md p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-600">Urgentes</p>
                    <p class="text-2xl font-bold text-red-600">${urgentRequests}</p>
                </div>
                <div class="w-12 h-12 bg-red-100 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                    </svg>
                </div>
            </div>
        </div>

        <div class="bg-white rounded-lg shadow-md p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-600">Terminées</p>
                    <p class="text-2xl font-bold text-green-600">${completedRequests}</p>
                </div>
                <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
            </div>
        </div>
    </div>

    <form method="get" action="requests" class="flex items-center gap-4">
        <label for="status" class="text-sm font-medium text-gray-700">Filtrer :</label>
        <select id="status" name="status"
                class="border border-gray-300 rounded-lg px-3 py-2 text-sm text-gray-700">
            <option value="Tous" ${selectedStatus == 'Tous' ? 'selected' : ''}>Tous</option>
            <option value="EN_ATTENTE" ${selectedStatus == 'EN_ATTENTE' ? 'selected' : ''}>En Course</option>
            <option value="TERMINEE" ${selectedStatus == 'TERMINEE' ? 'selected' : ''}>Terminée</option>
        </select>

        <button type="submit"
                class="bg-[#4A1D4A] hover:bg-[#6B2D6B] text-white px-4 py-2 rounded-lg text-sm transition-colors">
            Filtrer
        </button>
    </form>

    <div class="space-y-4">
        <c:forEach items="${expertiseRequests}" var="request">
            <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition">
                <div class="flex items-start justify-between mb-4">
                    <div class="flex items-center gap-3">
                        <c:choose>
                            <c:when test="${request.priorite == 'URGENTE'}">
                                <span class="px-3 py-1 bg-red-100 text-red-700 text-xs font-semibold rounded-full flex items-center gap-1">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                                    </svg>
                                    URGENTE
                                </span>
                            </c:when>
                            <c:when test="${request.priorite == 'NORMALE'}">
                                <span class="px-3 py-1 bg-yellow-100 text-yellow-700 text-xs font-semibold rounded-full">
                                    NORMALE
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="px-3 py-1 bg-green-100 text-green-700 text-xs font-semibold rounded-full">
                                    NON URGENTE
                                </span>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${request.statut == STATUT_EN_ATTENTE}">
                                <span class="px-3 py-1 bg-blue-100 text-blue-700 text-xs font-semibold rounded-full">
                                    En Cours
                                </span>
                            </c:when>
                            <c:when test="${request.statut == STATUT_TERMINEE}">
                                <span class="px-3 py-1 bg-green-100 text-green-700 text-xs font-semibold rounded-full">
                                    Terminée
                                </span>
                            </c:when>
                        </c:choose>
                    </div>

                    <span class="text-sm text-gray-500">${request.consultation.dateConsultation}</span>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-[#4A1D4A] rounded-full flex items-center justify-center">
                            <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-sm text-gray-600">Patient</p>
                            <p class="font-semibold text-gray-900">${request.consultation.patient.nom} ${request.consultation.patient.prenom}</p>
                        </div>
                    </div>

                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-gray-200 rounded-full flex items-center justify-center">
                            <svg class="w-5 h-5 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                        </div>
                        <div>
                            <p class="text-sm text-gray-600">Médecin Généraliste</p>
                            <p class="font-semibold text-gray-900">
                                Dr. ${request.consultation.medecinGeneraliste.nom} ${request.consultation.medecinGeneraliste.prenom}</p>
                        </div>
                    </div>
                </div>

                <div class="bg-gray-50 rounded-lg p-4 mb-4">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-3 text-sm">
                        <div>
                            <span class="font-medium text-gray-700">Motif :</span>
                            <span class="text-gray-900 ml-2">${request.consultation.motif}</span>
                        </div>
                        <div>
                            <span class="font-medium text-gray-700">Diagnostic :</span>
                            <span class="text-gray-900 ml-2">${request.consultation.diagnostic}</span>
                        </div>
                    </div>
                </div>

                <div class="mb-4">
                    <p class="text-sm font-medium text-gray-700 mb-2">Question du Médecin Généraliste :</p>
                    <p class="text-gray-900 bg-blue-50 p-3 rounded-lg border-l-4 border-[#4A1D4A]">
                            ${request.question}
                    </p>
                </div>

                <div class="flex justify-end gap-3">
                    <a href="view?id=${request.id}"
                       class="px-4 py-2 bg-[#4A1D4A] text-white rounded-lg hover:bg-[#6B2D6B] transition flex items-center gap-2">
                        View
                    </a>
                    <c:if test="${request.statut != 'TERMINEE'}">
                        <a href="respondExpertiseRequest?id=${request.id}"
                           class="px-4 py-2 bg-[#4A1D4A] text-white rounded-lg hover:bg-[#6B2D6B] transition flex items-center gap-2">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                            </svg>
                            Répondre
                        </a>
                    </c:if>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty expertiseRequests}">
            <div class="bg-white rounded-lg shadow-md p-12 text-center">
                <svg class="w-16 h-16 text-gray-400 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4"/>
                </svg>
                <h3 class="text-lg font-semibold text-gray-900 mb-2">Aucune demande d'expertise</h3>
                <p class="text-gray-600">Il n'y a actuellement aucune demande d'expertise correspondant à vos
                    critères.</p>
            </div>
        </c:if>
    </div>
</div>
<script>
    setTimeout(function () {
        const messages = document.querySelectorAll('.bg-green-50, .bg-red-50');
        messages.forEach(function (message) {
            message.style.transition = 'opacity 0.5s';
            message.style.opacity = '0';
            setTimeout(function () {
                message.remove();
            }, 500);
        });
    }, 5000);
</script>
</body>
</html>