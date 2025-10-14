<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Répondre à la Demande d'Expertise - MediExpert</title>
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
                <a href="specialistRequests" class="text-[#4A1D4A] font-medium hover:text-[#6B2D6B] transition-colors">
                    Mes Demandes
                </a>
            </div>
            <div class="flex items-center gap-4">
                <form action="logout" method="post">
                    <button type="submit" class="text-gray-600 hover:text-[#4A1D4A] transition-colors">Déconnexion
                    </button>
                </form>
            </div>
        </div>
    </div>
</nav>

<div class="max-w-5xl mx-auto px-4 py-8">
    <div class="mb-6">
        <a href="requests"
           class="inline-flex items-center text-[#4A1D4A] hover:text-[#6B2D6B] transition mb-4">
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
            </svg>
            Retour aux demandes
        </a>
        <div class="flex items-center justify-between">
            <div>
                <h1 class="text-3xl font-bold text-gray-900">Répondre à la Demande d'Expertise</h1>
                <p class="text-gray-600 mt-2">Fournir votre avis médical spécialisé</p>
            </div>
            <c:choose>
                <c:when test="${expertiseRequest.priorite == 'URGENTE'}">
                    <span class="px-4 py-2 bg-red-100 text-red-800 rounded-full text-sm font-semibold">
                        URGENTE
                    </span>
                </c:when>
                <c:when test="${expertiseRequest.priorite == 'NORMALE'}">
                    <span class="px-4 py-2 bg-yellow-100 text-yellow-800 rounded-full text-sm font-semibold">
                        NORMALE
                    </span>
                </c:when>
                <c:otherwise>
                    <span class="px-4 py-2 bg-green-100 text-green-800 rounded-full text-sm font-semibold">
                        NON URGENTE
                    </span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow-md p-6 mb-6">
        <div class="flex items-center mb-4">
            <svg class="w-6 h-6 text-[#4A1D4A] mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
            </svg>
            <h2 class="text-xl font-semibold text-gray-900">Informations du Patient</h2>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
            <div>
                <span class="font-medium text-gray-700">Nom complet :</span>
                <span class="text-gray-900 ml-2">${expertiseRequest.consultation.patient.nom} ${expertiseRequest.consultation.patient.prenom}</span>
            </div>
            <div>
                <span class="font-medium text-gray-700">Date de naissance :</span>
                <span class="text-gray-900 ml-2">${expertiseRequest.consultation.patient.dateNaissance}</span>
            </div>
            <div>
                <span class="font-medium text-gray-700">Téléphone :</span>
                <span class="text-gray-900 ml-2">${expertiseRequest.consultation.patient.telephone}</span>
            </div>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow-md p-6 mb-6">
        <div class="flex items-center mb-4">
            <svg class="w-6 h-6 text-[#4A1D4A] mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
            </svg>
            <h2 class="text-xl font-semibold text-gray-900">Détails de la Consultation</h2>
        </div>
        <div class="space-y-3 text-sm">
            <div>
                <span class="font-medium text-gray-700">Médecin Généraliste :</span>
                <span class="text-gray-900 ml-2">Dr. ${expertiseRequest.consultation.medecinGeneraliste.nom} ${expertiseRequest.consultation.medecinGeneraliste.prenom}</span>
            </div>
            <div>
                <span class="font-medium text-gray-700">Date de consultation :</span>
                <span class="text-gray-900 ml-2">${expertiseRequest.consultation.dateConsultation}</span>
            </div>
            <div>
                <span class="font-medium text-gray-700">Motif :</span>
                <p class="text-gray-900 mt-1 bg-gray-50 p-3 rounded-lg">${expertiseRequest.consultation.motif}</p>
            </div>
            <div>
                <span class="font-medium text-gray-700">Observations :</span>
                <p class="text-gray-900 mt-1 bg-gray-50 p-3 rounded-lg">${expertiseRequest.consultation.observations}</p>
            </div>
            <div>
                <span class="font-medium text-gray-700">Diagnostic :</span>
                <p class="text-gray-900 mt-1 bg-gray-50 p-3 rounded-lg">${expertiseRequest.consultation.diagnostic}</p>
            </div>
        </div>
    </div>

    <div class="bg-gradient-to-r from-[#4A1D4A] to-[#6B2D6B] rounded-lg shadow-md p-6 mb-6 text-white">
        <div class="flex items-center mb-4">
            <svg class="w-6 h-6 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
            <h2 class="text-xl font-semibold">Question du Médecin Généraliste</h2>
        </div>
        <p class="text-white leading-relaxed bg-white/10 p-4 rounded-lg">${expertiseRequest.question}</p>
    </div>

    <form action="respond" method="post" class="bg-white rounded-lg shadow-md p-6">
        <input type="hidden" name="requestId" value="${expertiseRequest.id}">

        <div class="flex items-center mb-6">
            <svg class="w-6 h-6 text-[#4A1D4A] mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
            </svg>
            <h2 class="text-xl font-semibold text-gray-900">Votre Réponse Médicale</h2>
        </div>

        <div class="mb-6">
            <label for="avisSpecialiste" class="block text-sm font-medium text-gray-700 mb-2">
                Avis Spécialiste <span class="text-red-500">*</span>
            </label>
            <textarea id="avisSpecialiste" name="avisSpecialiste" rows="6" required
                      placeholder="Fournissez votre avis médical spécialisé détaillé concernant le cas présenté..."
                      class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#4A1D4A] focus:border-transparent transition resize-none"></textarea>
                <p class="text-xs text-gray-500 mt-1">Décrivez votre analyse professionnelle du cas</p>
        </div>

        <div class="mb-6">
            <label for="recommandations" class="block text-sm font-medium text-gray-700 mb-2">
                Recommandations <span class="text-red-500">*</span>
            </label>
            <textarea id="recommandations" name="recommandations" rows="6" required
                      placeholder="Indiquez vos recommandations thérapeutiques, examens complémentaires, ou orientations à suivre..."
                      class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#4A1D4A] focus:border-transparent transition resize-none"></textarea>
            <p class="text-xs text-gray-500 mt-1">Proposez un plan d'action ou des recommandations spécifiques</p>

        </div>

        <div class="mb-6">
            <label for="statut" class="block text-sm font-medium text-gray-700 mb-2">
                Statut de la Demande <span class="text-red-500">*</span>
            </label>
            <select id="statut" name="statut" required
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#4A1D4A] focus:border-transparent transition">
                <option value="EN_ATTENTE" <c:if test="${expertiseRequest.statut eq 'EN_ATTENTE'}">selected</c:if>>En
                    Cours
                </option>
                <option value="TERMINEE" <c:if test="${expertiseRequest.statut eq 'TERMINEE'}">selected</c:if>>
                    Terminée
                </option>
            </select>
            <p class="text-xs text-gray-500 mt-1">Sélectionnez "Terminée" si votre réponse est complète</p>
        </div>

        <div class="flex justify-end space-x-4 pt-4 border-t border-gray-200">
            <a href="requests"
               class="px-6 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 transition">
                Annuler
            </a>
            <button type="submit"
                    class="px-6 py-2 bg-[#4A1D4A] text-white rounded-lg hover:bg-[#6B2D6B] transition flex items-center">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                </svg>
                Enregistrer la Réponse
            </button>
        </div>
    </form>
</div>
<script>
    setTimeout(function() {
        const messages = document.querySelectorAll('.bg-green-50, .bg-red-50');
        messages.forEach(function(message) {
            message.style.transition = 'opacity 0.5s';
            message.style.opacity = '0';
            setTimeout(function() {
                message.remove();
            }, 500);
        });
    }, 5000);
</script>
</body>
</html>