<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demande d'Expertise - MediExpert</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-50">
<!-- Navigation -->
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

<!-- Main Content -->
<div class="max-w-4xl mx-auto px-4 py-8">
    <!-- Header -->
    <div class="mb-6">
        <a href="viewPatient?id=${consultation.patient.id}" class="inline-flex items-center text-[#4A1D4A] hover:text-[#6B2D6B] transition mb-4">
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
            </svg>
            Retour aux consultations
        </a>
        <h1 class="text-3xl font-bold text-gray-900">Demande d'Expertise Médicale</h1>
        <p class="text-gray-600 mt-2">Demander l'avis d'un médecin spécialiste</p>
    </div>

    <c:if test="${not empty success}">
        <div class="mb-6 bg-green-50 border border-green-200 text-green-800 px-4 py-3 rounded-lg flex items-center">
            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
            </svg>
                ${success}
        </div>
        <c:remove var="success" scope="session"/>
    </c:if>

    <c:if test="${not empty error}">
        <div class="mb-6 bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-lg flex items-center">
            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
            </svg>
                ${error}
        </div>
        <c:remove var="error" scope="session"/>
    </c:if>

    <!-- Consultation Info Card -->
    <div class="bg-white rounded-lg shadow-md p-6 mb-6">
        <div class="flex items-center mb-4">
            <svg class="w-6 h-6 text-[#4A1D4A] mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
            </svg>
            <h2 class="text-xl font-semibold text-gray-900">Informations de la Consultation</h2>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
            <div>
                <span class="font-medium text-gray-700">Patient :</span>
                <span class="text-gray-900 ml-2">${consultation.patient.nom} ${consultation.patient.prenom}</span>
            </div>
            <div>
                <span class="font-medium text-gray-700">Date de consultation :</span>
                <span class="text-gray-900 ml-2">${consultation.dateConsultation}</span>
            </div>
            <div class="md:col-span-2">
                <span class="font-medium text-gray-700">Motif :</span>
                <span class="text-gray-900 ml-2">${consultation.motif}</span>
            </div>
            <div class="md:col-span-2">
                <span class="font-medium text-gray-700">Diagnostic :</span>
                <span class="text-gray-900 ml-2">${consultation.diagnostic}</span>
            </div>
        </div>
    </div>

    <!-- Expertise Request Form -->
    <form action="createExpertiseRequest" method="post" class="bg-white rounded-lg shadow-md p-6">
        <input type="hidden" name="consultationId" value="${consultation.id}">

        <div class="flex items-center mb-6">
            <svg class="w-6 h-6 text-[#4A1D4A] mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
            <h2 class="text-xl font-semibold text-gray-900">Détails de la Demande</h2>
        </div>

        <!-- Priority Selection -->
        <div class="mb-6">
            <label for="priorite" class="block text-sm font-medium text-gray-700 mb-2">
                Priorité <span class="text-red-500">*</span>
            </label>
            <select id="priorite" name="priorite" required
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#4A1D4A] focus:border-transparent transition">
                <option value="">Sélectionner une priorité</option>
                <option value="URGENTE">URGENTE</option>
                <option value="NORMALE" selected>NORMALE</option>
                <option value="NON_URGENTE">NON_URGENTE</option>
            </select>
        </div>

        <!-- Spécialistes filtrés -->
        <div class="mb-6">
            <label for="specialisteId" class="block text-sm font-medium text-gray-700 mb-2">
                Médecin Spécialiste <span class="text-red-500">*</span>
            </label>
            <select id="specialisteId" name="specialisteId" required
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#4A1D4A] focus:border-transparent transition">
                <option value="">Sélectionner un spécialiste</option>
                <c:forEach items="${specialistes}" var="specialiste">
                    <option value="${specialiste.id}">
                        Dr. ${specialiste.nom} ${specialiste.prenom} - ${specialiste.specialite} (${specialiste.tarif} MAD)
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-6">
            <label for="creneauDate" class="block text-sm font-medium text-gray-700 mb-2">
                Choisir un créneau <span class="text-red-500">*</span>
            </label>
            <input
                    type="datetime-local"
                    id="creneauDate"
                    name="creneauDate"
                    required
                    class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#4A1D4A] focus:border-transparent transition"
            />
        </div>

        <!-- Question -->
        <div class="mb-6">
            <label for="question" class="block text-sm font-medium text-gray-700 mb-2">
                Question pour le Spécialiste <span class="text-red-500">*</span>
            </label>
            <textarea id="question" name="question" rows="6" required
                      placeholder="Décrivez en détail la question ou le problème médical pour lequel vous demandez l'expertise du spécialiste..."
                      class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#4A1D4A] focus:border-transparent transition resize-none"></textarea>
            <p class="text-xs text-gray-500 mt-1">Soyez aussi précis que possible pour obtenir un avis pertinent</p>
        </div>

        <!-- Action Buttons -->
        <div class="flex justify-end space-x-4">
            <a href="viewPatient?id=${consultation.patient.id}"
               class="px-6 py-2 border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 transition">
                Annuler
            </a>
            <button type="submit"
                    class="px-6 py-2 bg-[#4A1D4A] text-white rounded-lg hover:bg-[#6B2D6B] transition flex items-center">
                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"/>
                </svg>
                Envoyer la Demande
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