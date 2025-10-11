<%@ page import="com.teleexpertise.model.User" %>
<%@ page import="com.teleexpertise.enums.Role" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    if (!user.getRole().equals(Role.GENERALISTE)) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation Patient - MediExpert</title>
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
                <a href="patients" class="text-gray-600 hover:text-primary transition-colors">
                    Liste des Patients
                </a>
            </div>
            <div class="flex items-center gap-4">
                <span class="text-sm text-gray-600">Dr. ${sessionScope.user.nom} ${sessionScope.user.prenom}</span>
                <form action="logout" method="post">
                    <button type="submit" class="text-gray-600 hover:text-primary transition-colors">Logout</button>
                </form>
            </div>
        </div>
    </div>
</nav>

<main class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 mb-6">
        <div class="flex items-center gap-3 mb-4">
            <div class="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center">
                <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                </svg>
            </div>
            <h2 class="text-xl font-bold text-gray-900">Informations du Patient</h2>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
                <p class="text-sm text-gray-500">Nom complet</p>
                <p class="text-base font-semibold text-gray-900">${patient.nom} ${patient.prenom}</p>
            </div>
            <div>
                <p class="text-sm text-gray-500">Date de naissance</p>
                <p class="text-base font-semibold text-gray-900">${patient.dateNaissance}</p>
            </div>
            <div>
                <p class="text-sm text-gray-500">Téléphone</p>
                <p class="text-base font-semibold text-gray-900">${patient.telephone}</p>
            </div>
            <div>
                <p class="text-sm text-gray-500">N° Sécurité Sociale</p>
                <p class="text-base font-semibold text-gray-900 font-mono">${patient.numSecuriteSociale}</p>
            </div>
        </div>
    </div>

    <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 md:p-8">
        <div class="flex items-center gap-3 mb-6">
            <div class="w-10 h-10 bg-primary/10 rounded-lg flex items-center justify-center">
                <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                </svg>
            </div>
            <h2 class="text-xl font-bold text-gray-900">Nouvelle Consultation</h2>
        </div>

        <form action="saveConsultation" method="post" class="space-y-6">
            <input type="hidden" name="patientId" value="${patient.id}">

            <div>
                <label for="dateConsultation" class="block text-sm font-medium text-gray-700 mb-2">
                    Date de consultation <span class="text-red-500">*</span>
                </label>
                <input type="datetime-local" id="dateConsultation" name="dateConsultation" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all">
            </div>

            <div>
                <label for="motif" class="block text-sm font-medium text-gray-700 mb-2">
                    Motif de consultation <span class="text-red-500">*</span>
                </label>
                <input type="text" id="motif" name="motif" required
                       placeholder="Ex: Douleurs abdominales, Contrôle de routine..."
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all">
            </div>

            <div>
                <label for="observations" class="block text-sm font-medium text-gray-700 mb-2">
                    Observations <span class="text-red-500">*</span>
                </label>
                <textarea id="observations" name="observations" rows="4" required
                          placeholder="Décrivez les symptômes, l'examen clinique, les antécédents pertinents..."
                          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent resize-none transition-all"></textarea>
            </div>

            <div>
                <label for="diagnostic" class="block text-sm font-medium text-gray-700 mb-2">
                    Diagnostic <span class="text-red-500">*</span>
                </label>
                <textarea id="diagnostic" name="diagnostic" rows="3" required
                          placeholder="Diagnostic médical, codes CIM-10 si applicable..."
                          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent resize-none transition-all"></textarea>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <label for="cout" class="block text-sm font-medium text-gray-700 mb-2">
                        Coût de la consultation (DH) <span class="text-red-500">*</span>
                    </label>
                    <div class="relative">
                        <input type="number" id="cout" name="cout" step="0.01" value="150.00" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all">
                        <span class="absolute right-3 top-2.5 text-gray-500">DH</span>
                    </div>
                </div>

                <div>
                    <label for="statut" class="block text-sm font-medium text-gray-700 mb-2">
                        Statut <span class="text-red-500">*</span>
                    </label>
                    <select id="statut" name="statut" required
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all">
                        <option value="EN_COURS">En cours</option>
                        <option value="TERMINEE">Terminée</option>
                        <option value="EN_ATTENTE_AVIS_SPECIALISTE">En attente avis specialiste</option>
                    </select>
                </div>
            </div>

            <div class="border-t pt-6 mt-8">
                <div class="flex items-center gap-3 mb-6">
                    <div class="w-10 h-10 bg-accent/10 rounded-lg flex items-center justify-center">
                        <svg class="w-6 h-6 text-accent" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                        </svg>
                    </div>
                    <h3 class="text-lg font-bold text-gray-900">Actes Médicaux</h3>
                </div>

                <div id="actes-container" class="space-y-4">
                    <div class="acte border border-gray-200 rounded-lg p-5 bg-gray-50">
                        <div class="flex items-center justify-between mb-4">
                            <h4 class="text-base font-semibold text-gray-900 flex items-center">
                                <svg class="w-5 h-5 mr-2 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                                </svg>
                                Acte Médical #1
                            </h4>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    Nom de l'acte <span class="text-red-500">*</span>
                                </label>
                                <input
                                        type="text"
                                        name="libelle[]"
                                        required
                                        placeholder="Ex: Consultation générale, Radiographie..."
                                        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all"
                                >
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">
                                    Coût (DH) <span class="text-red-500">*</span>
                                </label>
                                <div class="relative">
                                    <input
                                            type="number"
                                            name="coutActe[]"
                                            required
                                            step="0.01"
                                            min="0"
                                            placeholder="0.00"
                                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary focus:border-transparent transition-all"
                                    >
                                    <span class="absolute right-3 top-2.5 text-gray-500">DH</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mt-4">
                    <button
                            type="button"
                            onclick="addActe()"
                            class="w-full md:w-auto px-6 py-3 bg-white border-2 border-primary text-primary rounded-lg hover:bg-primary hover:text-white transition-all duration-200 font-medium flex items-center justify-center gap-2"
                    >
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                        </svg>
                        <span>Ajouter un autre acte</span>
                    </button>
                </div>
            </div>

            <div class="flex flex-col sm:flex-row gap-4 pt-6 border-t">
                <button type="submit"
                        class="flex-1 bg-primary hover:bg-secondary text-white font-medium py-3 px-6 rounded-lg transition-colors flex items-center justify-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                    </svg>
                    <span>Enregistrer la consultation</span>
                </button>
                <a href="patients"
                   class="flex-1 bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-3 px-6 rounded-lg transition-colors text-center flex items-center justify-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                    </svg>
                    <span>Annuler</span>
                </a>
            </div>
        </form>
    </div>
</main>

<script>
    let acteCount = 1;

    function addActe() {
        acteCount++;
        const container = document.getElementById('actes-container');
        const newActe = document.createElement('div');
        newActe.className = 'acte border border-gray-200 rounded-lg p-5 bg-gray-50 relative';
        newActe.innerHTML = `
            <div class="flex items-center justify-between mb-4">
                <h4 class="text-base font-semibold text-gray-900 flex items-center">
                    <svg class="w-5 h-5 mr-2 text-[#4A1D4A]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                    </svg>
                    Acte Médical #${acteCount}
                </h4>
                <button
                    type="button"
                    onclick="removeActe(this)"
                    class="text-red-500 hover:text-red-700 transition-colors p-1"
                    title="Supprimer cet acte"
                >
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                    </svg>
                </button>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">
                        Nom de l'acte <span class="text-red-500">*</span>
                    </label>
                    <input
                        type="text"
                        name="libelle[]"
                        required
                        placeholder="Ex: Consultation générale, Radiographie..."
                        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#4A1D4A] focus:border-transparent transition-all"
                    >
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">
                        Coût (DH) <span class="text-red-500">*</span>
                    </label>
                    <div class="relative">
                        <input
                            type="number"
                            name="coutActe[]"
                            required
                            step="0.01"
                            min="0"
                            placeholder="0.00"
                            class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#4A1D4A] focus:border-transparent transition-all"
                        >
                        <span class="absolute right-3 top-2.5 text-gray-500">DH</span>
                    </div>
                </div>
            </div>
        `;
        container.appendChild(newActe);
    }

    function removeActe(button) {
        const acteDiv = button.closest('.acte');
        acteDiv.remove();
        const actes = document.querySelectorAll('.acte');
        actes.forEach((acte, index) => {
            const title = acte.querySelector('h4');
            title.innerHTML = `
                <svg class="w-5 h-5 mr-2 text-[#4A1D4A]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/>
                </svg>
                Acte Médical #${index + 1}
            `;
        });
        acteCount = actes.length;
    }
    </script>