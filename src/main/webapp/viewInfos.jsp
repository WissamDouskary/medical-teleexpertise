<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détail Demande d'Expertise - MediExpert</title>
    <script src="https://cdn.tailwindcss.com"></script>
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

<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <div class="mb-6">
        <a href="requests" class="inline-flex items-center text-[#4A1D4A] hover:text-purple-700 transition-colors">
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
            </svg>
            Retour aux demandes
        </a>
    </div>

    <div class="bg-white rounded-lg shadow-md p-6 mb-6">
        <div class="flex items-start justify-between mb-4">
            <div>
                <h2 class="text-2xl font-bold text-gray-900 mb-2">Demande d'Expertise #${expertiseRequest.id}</h2>
            </div>
            <div class="flex flex-col items-end space-y-2">
                <c:choose>
                    <c:when test="${expertiseRequest.priorite == 'URGENTE'}">
                            <span class="px-4 py-2 bg-red-100 text-red-800 rounded-full text-sm font-semibold flex items-center">
                                <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                                    <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                                </svg>
                                Urgente
                            </span>
                    </c:when>
                    <c:when test="${expertiseRequest.priorite == 'NORMALE'}">
                        <span class="px-4 py-2 bg-yellow-100 text-yellow-800 rounded-full text-sm font-semibold">Normale</span>
                    </c:when>
                    <c:otherwise>
                        <span class="px-4 py-2 bg-green-100 text-green-800 rounded-full text-sm font-semibold">Non Urgente</span>
                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test="${expertiseRequest.statut == EN_ATTENTE}">
                        <span class="px-4 py-2 bg-orange-100 text-orange-800 rounded-full text-sm font-semibold">En Cours</span>
                    </c:when>
                    <c:when test="${expertiseRequest.statut == TERMINEE}">
                        <span class="px-4 py-2 bg-green-100 text-green-800 rounded-full text-sm font-semibold">Terminée</span>
                    </c:when>
                    <c:otherwise>
                        <span class="px-4 py-2 bg-gray-100 text-gray-800 rounded-full text-sm font-semibold">${expertiseRequest.statut}</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="bg-purple-50 rounded-lg p-4 border border-purple-200">
            <div class="flex items-center space-x-3">
                <div class="w-12 h-12 bg-[#4A1D4A] rounded-full flex items-center justify-center text-white font-semibold">
                    ${expertiseRequest.consultation.medecinGeneraliste.nom.substring(0,1)}${expertiseRequest.consultation.medecinGeneraliste.prenom.substring(0,1)}
                </div>
                <div>
                    <p class="text-sm text-gray-600">Demande de</p>
                    <p class="font-semibold text-gray-900">Dr. ${expertiseRequest.consultation.medecinGeneraliste.prenom} ${expertiseRequest.consultation.medecinGeneraliste.nom}</p>
                    <p class="text-sm text-gray-600">Médecin Généraliste</p>
                </div>
            </div>
        </div>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <div class="lg:col-span-2 space-y-6">
            <div class="bg-white rounded-lg shadow-md p-6">
                <div class="flex items-center justify-between mb-4">
                    <h3 class="text-xl font-bold text-gray-900 flex items-center">
                        <svg class="w-6 h-6 mr-2 text-[#4A1D4A]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                        </svg>
                        Dossier Patient
                    </h3>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="bg-gray-50 rounded-lg p-4">
                        <p class="text-sm text-gray-600 mb-1">Nom Complet</p>
                        <p class="font-semibold text-gray-900">${expertiseRequest.consultation.patient.nom} ${expertiseRequest.consultation.patient.prenom}</p>
                    </div>
                    <div class="bg-gray-50 rounded-lg p-4">
                        <p class="text-sm text-gray-600 mb-1">Date de Naissance</p>
                        <p class="font-semibold text-gray-900">${expertiseRequest.consultation.patient.dateNaissance}</p>
                    </div>
                    <div class="bg-gray-50 rounded-lg p-4">
                        <p class="text-sm text-gray-600 mb-1">Téléphone</p>
                        <p class="font-semibold text-gray-900">${expertiseRequest.consultation.patient.telephone}</p>
                    </div>
                    <div class="bg-gray-50 rounded-lg p-4 md:col-span-2">
                        <p class="text-sm text-gray-600 mb-1">Adresse</p>
                        <p class="font-semibold text-gray-900">${expertiseRequest.consultation.patient.adresse}</p>
                    </div>
                </div>

<%--                <c:if test="${not empty expertiseRequest.consultation.patient.signesVitaux}">--%>
<%--                    <c:forEach>--%>
<%--                    <div class="mt-4 pt-4 border-t border-gray-200">--%>
<%--                        <h4 class="font-semibold text-gray-900 mb-2 flex items-center">--%>
<%--                            <svg class="w-5 h-5 mr-2 text-[#4A1D4A]" fill="none" stroke="currentColor" viewBox="0 0 24 24">--%>
<%--                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>--%>
<%--                            </svg>--%>
<%--                            Antécédents Médicaux--%>
<%--                        </h4>--%>
<%--                        <p class="text-gray-700 bg-yellow-50 rounded-lg p-3 border border-yellow-200">${expertiseRequest.consultation.patient.signesVitaux}</p>--%>
<%--                    </div>--%>
<%--                    </c:forEach>--%>
<%--                </c:if>--%>
            </div>

            <div class="bg-white rounded-lg shadow-md p-6">
                <h3 class="text-xl font-bold text-gray-900 mb-4 flex items-center">
                    <svg class="w-6 h-6 mr-2 text-[#4A1D4A]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                    </svg>
                    Détails de la Consultation
                </h3>

                <div class="space-y-4">
                    <div class="bg-gray-50 rounded-lg p-4">
                        <p class="text-sm text-gray-600 mb-1">Date de Consultation</p>
                        <p class="font-semibold text-gray-900">${expertiseRequest.consultation.dateConsultation}</p>
                    </div>

                    <div class="bg-gray-50 rounded-lg p-4">
                        <p class="text-sm text-gray-600 mb-1">Motif de Consultation</p>
                        <p class="font-semibold text-gray-900">${expertiseRequest.consultation.motif}</p>
                    </div>

                    <div class="bg-gray-50 rounded-lg p-4">
                        <p class="text-sm text-gray-600 mb-1">Observations</p>
                        <p class="text-gray-900">${expertiseRequest.consultation.observations}</p>
                    </div>

                    <div class="bg-gray-50 rounded-lg p-4">
                        <p class="text-sm text-gray-600 mb-1">Diagnostic</p>
                        <p class="text-gray-900">${expertiseRequest.consultation.diagnostic}</p>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div class="bg-gray-50 rounded-lg p-4">
                            <p class="text-sm text-gray-600 mb-1">Coût</p>
                            <p class="font-semibold text-gray-900"><fmt:formatNumber value="${expertiseRequest.consultation.cout}" type="currency" currencySymbol="€"/></p>
                        </div>
                        <div class="bg-gray-50 rounded-lg p-4">
                            <p class="text-sm text-gray-600 mb-1">Statut</p>
                            <p class="font-semibold text-gray-900">${expertiseRequest.consultation.statut}</p>
                        </div>
                    </div>
                </div>
            </div>

            <c:if test="${not empty expertiseRequest.consultation.acteMedicals}">
                <div class="bg-white rounded-lg shadow-md p-6">
                    <h3 class="text-xl font-bold text-gray-900 mb-4 flex items-center">
                        <svg class="w-6 h-6 mr-2 text-[#4A1D4A]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"/>
                        </svg>
                        Actes Médicaux
                    </h3>

                    <div class="space-y-3">
                        <c:forEach var="acte" items="${expertiseRequest.consultation.acteMedicals}">
                            <div class="flex items-center justify-between bg-gray-50 rounded-lg p-4 border border-gray-200">
                                <div class="flex items-center space-x-3">
                                    <div class="w-10 h-10 bg-[#4A1D4A] rounded-lg flex items-center justify-center">
                                        <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                        </svg>
                                    </div>
                                    <div>
                                        <p class="font-semibold text-gray-900">${acte.type}</p>
                                        <p class="text-sm text-gray-600">Acte médical</p>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <p class="font-bold text-[#4A1D4A]"><fmt:formatNumber value="${acte.price}" type="currency" currencySymbol="€"/></p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </div>

        <div class="space-y-6">
            <div class="bg-gradient-to-br from-[#4A1D4A] to-purple-700 rounded-lg shadow-md p-6 text-white sticky top-6">
                <h3 class="text-lg font-bold mb-3 flex items-center">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    Question du Généraliste
                </h3>
                <div class="bg-white/10 backdrop-blur-sm rounded-lg p-4">
                    <p class="text-white leading-relaxed">${expertiseRequest.question}</p>
                </div>
            </div>

            <c:choose>
                <c:when test="${not empty expertiseRequest.avisSpecialiste}">
                    Response Already Provided
                    <div class="bg-white rounded-lg shadow-md p-6">
                        <h3 class="text-lg font-bold text-gray-900 mb-4 flex items-center">
                            <svg class="w-5 h-5 mr-2 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                            </svg>
                            Votre Réponse
                        </h3>

                        <div class="space-y-4">
                            <div>
                                <p class="text-sm font-semibold text-gray-700 mb-2">Avis Spécialiste</p>
                                <div class="bg-green-50 rounded-lg p-4 border border-green-200">
                                    <p class="text-gray-900">${expertiseRequest.avisSpecialiste}</p>
                                </div>
                            </div>

                            <c:if test="${not empty expertiseRequest.recommandations}">
                                <div>
                                    <p class="text-sm font-semibold text-gray-700 mb-2">Recommandations</p>
                                    <div class="bg-blue-50 rounded-lg p-4 border border-blue-200">
                                        <p class="text-gray-900">${expertiseRequest.recommandations}</p>
                                    </div>
                                </div>
                            </c:if>

                            <div class="pt-4 border-t border-gray-200">
                                <a href="respond-expertise-request.jsp?id=${expertiseRequest.id}" class="w-full inline-flex items-center justify-center px-4 py-2 bg-[#4A1D4A] text-white rounded-lg hover:bg-purple-800 transition-colors">
                                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                    </svg>
                                    Modifier la Réponse
                                </a>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="bg-white rounded-lg shadow-md p-6">
                        <div class="text-center py-8">
                            <div class="w-16 h-16 bg-orange-100 rounded-full flex items-center justify-center mx-auto mb-4">
                                <svg class="w-8 h-8 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                                </svg>
                            </div>
                            <h4 class="text-lg font-semibold text-gray-900 mb-2">En Attente de Réponse</h4>
                            <p class="text-gray-600 mb-6">Cette demande nécessite votre expertise</p>
                            <a href="respondExpertiseRequest?id=${expertiseRequest.id}" class="inline-flex items-center px-6 py-3 bg-[#4A1D4A] text-white rounded-lg hover:bg-purple-800 transition-colors font-semibold">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                </svg>
                                Répondre à la Demande
                            </a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>

            <div class="bg-white rounded-lg shadow-md p-6">
                <h3 class="text-lg font-bold text-gray-900 mb-4">Actions Rapides</h3>
                <div class="space-y-3">
                    <a href="requests" class="w-full inline-flex items-center justify-center px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200 transition-colors">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 10h16M4 14h16M4 18h16"/>
                        </svg>
                        Toutes les Demandes
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>

<footer class="bg-white border-t border-gray-200 mt-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <p class="text-center text-gray-600">&copy; 2025 MediExpert. Tous droits réservés.</p>
    </div>
</footer>
</body>
</html>