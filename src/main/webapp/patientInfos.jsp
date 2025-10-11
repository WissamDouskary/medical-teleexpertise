<%@ page import="com.teleexpertise.model.User" %>
<%@ page import="com.teleexpertise.enums.Role" %>
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
    <title>Détails du Patient - Téléexpertise Médicale</title>
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

<main class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="mb-8">
        <div class="flex items-center gap-4 mb-4">
            <a href="patients" class="text-primary hover:text-secondary transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
                </svg>
            </a>
            <h1 class="text-3xl font-bold text-gray-900">Dossier Patient #${patient.id}</h1>
        </div>
        <p class="text-gray-600">Informations détaillées du patient et signes vitaux</p>
    </div>

    <!-- Patient Information Card -->
    <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 md:p-8 mb-6">
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
                <label class="block text-sm font-medium text-gray-500 mb-1">Nom</label>
                <p class="text-base font-semibold text-gray-900">${patient.nom}</p>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-500 mb-1">Prénom</label>
                <p class="text-base font-semibold text-gray-900">${patient.prenom}</p>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-500 mb-1">Date de Naissance</label>
                <p class="text-base font-semibold text-gray-900">${patient.dateNaissance}</p>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-500 mb-1">N° Sécurité Sociale</label>
                <p class="text-base font-semibold text-gray-900">${patient.numSecuriteSociale}</p>
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-500 mb-1">Téléphone</label>
                <p class="text-base font-semibold text-gray-900">${patient.telephone}</p>
            </div>

            <div class="md:col-span-2">
                <label class="block text-sm font-medium text-gray-500 mb-1">Adresse</label>
                <p class="text-base font-semibold text-gray-900">${patient.adresse}</p>
            </div>
        </div>
    </div>

    <!-- Vital Signs Card -->
    <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 md:p-8">
        <div class="flex items-center gap-3 mb-6">
            <div class="w-10 h-10 bg-primary/10 rounded-lg flex items-center justify-center">
                <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                </svg>
            </div>
            <h2 class="text-xl font-semibold text-gray-900">Signes Vitaux</h2>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="p-4 bg-gray-50 rounded-lg">
                <label class="block text-sm font-medium text-gray-500 mb-1">Tension Artérielle</label>
                <p class="text-2xl font-bold text-primary">${signes.tensionArterielle} <span class="text-sm font-normal text-gray-600">mmHg</span></p>
            </div>

            <div class="p-4 bg-gray-50 rounded-lg">
                <label class="block text-sm font-medium text-gray-500 mb-1">Fréquence Cardiaque</label>
                <p class="text-2xl font-bold text-primary">${signes.frequenceCardiaque} <span class="text-sm font-normal text-gray-600">bpm</span></p>
            </div>

            <div class="p-4 bg-gray-50 rounded-lg">
                <label class="block text-sm font-medium text-gray-500 mb-1">Température</label>
                <p class="text-2xl font-bold text-primary">${signes.temperature} <span class="text-sm font-normal text-gray-600">°C</span></p>
            </div>

            <div class="p-4 bg-gray-50 rounded-lg">
                <label class="block text-sm font-medium text-gray-500 mb-1">Fréquence Respiratoire</label>
                <p class="text-2xl font-bold text-primary">${signes.frequenceRespiratoire} <span class="text-sm font-normal text-gray-600">rpm</span></p>
            </div>

            <div class="p-4 bg-gray-50 rounded-lg">
                <label class="block text-sm font-medium text-gray-500 mb-1">Poids</label>
                <p class="text-2xl font-bold text-primary">${signes.poids} <span class="text-sm font-normal text-gray-600">kg</span></p>
            </div>

            <div class="p-4 bg-gray-50 rounded-lg">
                <label class="block text-sm font-medium text-gray-500 mb-1">Taille</label>
                <p class="text-2xl font-bold text-primary">${signes.taille} <span class="text-sm font-normal text-gray-600">cm</span></p>
            </div>
        </div>

    </div>

    <!-- Action Buttons -->
    <div class="flex flex-col sm:flex-row gap-4 justify-end mt-8">
        <a
                href="patients"
                class="px-6 py-3 border border-gray-300 rounded-lg text-gray-700 font-medium hover:bg-gray-50 transition-colors text-center"
        >
            Retour à la liste
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