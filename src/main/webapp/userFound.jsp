<%@ page import="com.teleexpertise.model.User" %>
<%@ page import="com.teleexpertise.enums.Role" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    User user = (User) session.getAttribute("user");

    if (user == null || user.getRole() == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    if (user.getRole().equals(Role.GENERALISTE)) {
        response.sendRedirect("patients");
        return;
    }
%>
<html>
<head>
    <title>Utilisateur déja trouvé</title>
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
<body>
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
<main class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <form action="${pageContext.request.contextPath}/searchPatient" method="post" class="space-y-8">
        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 md:p-8">
            <div class="flex items-center gap-3 mb-6">
                <div class="w-10 h-10 bg-primary/10 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                    </svg>
                </div>
                <h2 class="text-xl font-semibold text-gray-900">Informations du Patient</h2>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label for="numSecuriteSociale" class="block text-sm font-medium text-gray-700 mb-2">
                        N° Sécurité Sociale <span class="text-red-500">*</span>
                    </label>
                    <input
                            type="text"
                            id="numSecuriteSociale"
                            name="numSecuriteSociale"
                            required
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-colors"
                            placeholder="123456789012345"
                    >
                </div>
            </div>
            <div class="flex flex-col sm:flex-row gap-4 justify-end mt-4">
                <button
                        type="submit"
                        class="px-6 py-3 bg-primary text-white rounded-lg font-medium hover:bg-secondary transition-colors shadow-sm"
                >
                    Rechercher
                </button>
            </div>
            <c:if test="${not empty succes}">
                <p class="text-green-500">${succes}</p>
            </c:if>

            <c:if test="${not empty requestScope.sucess}">
                <p class="text-green-500">${requestScope.sucess}</p>
            </c:if>


            <c:if test="${requestScope.isFound == true}">
                <h3 class="text-lg font-semibold text-gray-700 mb-2">Patient details:</h3>
                <ul class="text-gray-600">
                    <li><strong>Nom:</strong> ${patient.nom}</li>
                    <li><strong>Prénom:</strong> ${patient.prenom}</li>
                    <li><strong>Date de naissance:</strong> ${patient.dateNaissance}</li>
                    <li><strong>Adresse:</strong> ${patient.adresse}</li>
                    <li><strong>Téléphone:</strong> ${patient.telephone}</li>
                    <li><strong>Numéro Sécu:</strong> ${patient.numSecuriteSociale}</li>
                </ul>
            </c:if>

            <c:if test="${requestScope.isFound == false}">
                <p class="text-red-500 font-medium mt-4">${error}</p>
            </c:if>
        </div>
    </form>

    <c:if test="${requestScope.isFound == true}">
        <form action="${pageContext.request.contextPath}/updateSignes" method="post" class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 md:p-8">
            <div class="flex items-center gap-3 mb-6">
                <div class="w-10 h-10 bg-primary/10 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                    </svg>
                </div>
                <h2 class="text-xl font-semibold text-gray-900">Signes Vitaux</h2>
            </div>
            <input type="hidden" value="${patient.id}" name="patient_id"/>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label for="tensionArterielle" class="block text-sm font-medium text-gray-700 mb-2">
                        Tension Artérielle (mmHg) <span class="text-red-500">*</span>
                    </label>
                    <input
                            type="number"
                            id="tensionArterielle"
                            name="tensionArterielle"
                            value="${signVitaux.tensionArterielle}"
                            required
                            step="0.1"
                            min="0"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-colors"
                            placeholder="120"
                    >
                </div>

                <div>
                    <label for="frequenceCardiaque" class="block text-sm font-medium text-gray-700 mb-2">
                        Fréquence Cardiaque (bpm) <span class="text-red-500">*</span>
                    </label>
                    <input
                            type="number"
                            id="frequenceCardiaque"
                            name="frequenceCardiaque"
                            value="${signVitaux.frequenceCardiaque}"
                            required
                            min="0"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-colors"
                            placeholder="72"
                    >
                </div>

                <div>
                    <label for="temperature" class="block text-sm font-medium text-gray-700 mb-2">
                        Température (°C) <span class="text-red-500">*</span>
                    </label>
                    <input
                            type="number"
                            id="temperature"
                            name="temperature"
                            value="${signVitaux.temperature}"
                            required
                            step="0.1"
                            min="0"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-colors"
                            placeholder="37.0"
                    >
                </div>

                <div>
                    <label for="frequenceRespiratoire" class="block text-sm font-medium text-gray-700 mb-2">
                        Fréquence Respiratoire (rpm) <span class="text-red-500">*</span>
                    </label>
                    <input
                            type="number"
                            id="frequenceRespiratoire"
                            name="frequenceRespiratoire"
                            value="${signVitaux.frequenceRespiratoire}"
                            required
                            min="0"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-colors"
                            placeholder="16"
                    >
                </div>

                <div>
                    <label for="poids" class="block text-sm font-medium text-gray-700 mb-2">
                        Poids (kg) <span class="text-red-500">*</span>
                    </label>
                    <input
                            type="number"
                            id="poids"
                            name="poids"
                            value="${signVitaux.poids}"
                            required
                            step="0.1"
                            min="0"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-colors"
                            placeholder="70.5"
                    >
                </div>

                <div>
                    <label for="taille" class="block text-sm font-medium text-gray-700 mb-2">
                        Taille (cm) <span class="text-red-500">*</span>
                    </label>
                    <input
                            type="number"
                            id="taille"
                            name="taille"
                            value="${signVitaux.taille}"
                            required
                            step="0.1"
                            min="0"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-colors"
                            placeholder="175"
                    >
                </div>
            </div>

            <div class="flex justify-end mt-4">
            <button
                    type="submit"
                    class="px-6 py-3 bg-primary text-white rounded-lg font-medium hover:bg-secondary transition-colors shadow-sm"
            >
                Save Signe Vital
            </button>
            </div>
        </form>
    </c:if>
</main>
</body>
</html>
