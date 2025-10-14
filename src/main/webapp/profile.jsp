<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier mon profil - MediExpert</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .primary-color {
            background-color: #4A1D4A;
        }
        .primary-hover:hover {
            background-color: #6B2D6B;
        }
        .primary-text {
            color: #4A1D4A;
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
                    <button type="submit" class="text-gray-600 hover:text-[#4A1D4A] transition-colors">Déconnexion</button>
                </form>
            </div>
        </div>
    </div>
</nav>

<div class="max-w-4xl mx-auto px-4 py-8">
    <div class="mb-8">
        <div class="flex items-center mb-2">
            <a href="requests" class="text-gray-600 hover:text-gray-800 mr-4">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
                </svg>
            </a>
            <h1 class="text-3xl font-bold primary-text">Modifier mon profil</h1>
        </div>
        <p class="text-gray-600">Mettez à jour votre spécialité et votre tarif de consultation</p>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="mb-6 bg-green-50 border border-green-200 text-green-800 px-4 py-3 rounded-lg flex items-center">
            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
            </svg>
                ${successMessage}
        </div>
        <c:remove var="successMessage" scope="session"/>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="mb-6 bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-lg flex items-center">
            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
            </svg>
                ${errorMessage}
        </div>
        <c:remove var="errorMessage" scope="session"/>
    </c:if>

    <div class="bg-white rounded-lg shadow-md p-6">
        <form action="${pageContext.request.contextPath}/editprofile" method="post">
            <input type="hidden" name="specialisteId" value="${specialiste.id}">

            <div class="mb-6 p-4 bg-purple-50 rounded-lg border border-purple-100">
                <h3 class="text-sm font-semibold primary-text mb-2">Informations actuelles</h3>
                <div class="grid grid-cols-2 gap-4 text-sm">
                    <div>
                        <span class="text-gray-600">Nom complet:</span>
                        <span class="font-medium ml-2">Dr. ${specialiste.nom} ${specialiste.prenom}</span>
                    </div>
                    <div>
                        <span class="text-gray-600">Email:</span>
                        <span class="font-medium ml-2">${specialiste.email}</span>
                    </div>
                </div>
            </div>

            <div class="mb-6">
                <label for="specialite" class="block text-sm font-semibold text-gray-700 mb-2">
                    <svg class="w-5 h-5 inline mr-2 primary-text" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"/>
                    </svg>
                    Spécialité <span class="text-red-500">*</span>
                </label>
                <select id="specialite" name="specialite" required
                        class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent">
                    <option value="">Sélectionnez une spécialité</option>
                    <option value="Cardiologie" ${specialiste.specialite == 'Cardiologie' ? 'selected' : ''}>Cardiologie</option>
                    <option value="Pneumologie" ${specialiste.specialite == 'Pneumologie' ? 'selected' : ''}>Pneumologie</option>
                    <option value="Neurologie" ${specialiste.specialite == 'Neurologie' ? 'selected' : ''}>Neurologie</option>
                    <option value="GASTRO_ENTEROLOGIE" ${specialiste.specialite == 'GASTRO_ENTEROLOGIE' ? 'selected' : ''}>Gastro-entérologie</option>
                    <option value="Endocrinologie" ${specialiste.specialite == 'Endocrinologie' ? 'selected' : ''}>Endocrinologie</option>
                    <option value="Dermatologie" ${specialiste.specialite == 'Dermatologie' ? 'selected' : ''}>Dermatologie</option>
                    <option value="Rhumatologie" ${specialiste.specialite == 'Rhumatologie' ? 'selected' : ''}>Rhumatologie</option>
                    <option value="Psychiatrie" ${specialiste.specialite == 'Psychiatrie' ? 'selected' : ''}>Psychiatrie</option>
                    <option value="Néphrologie" ${specialiste.specialite == 'Néphrologie' ? 'selected' : ''}>Néphrologie</option>
                    <option value="Orthopédie" ${specialiste.specialite == 'Orthopédie' ? 'selected' : ''}>Orthopédie</option>
                </select>
                <p class="text-sm text-gray-500 mt-1">Votre domaine de spécialisation médicale</p>
            </div>
            <div class="mb-6">
                <label for="tarif" class="block text-sm font-semibold text-gray-700 mb-2">
                    <svg class="w-5 h-5 inline mr-2 primary-text" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                    Tarif de consultation (DH) <span class="text-red-500">*</span>
                </label>
                <div class="relative">
                    <input type="number" id="tarif" name="tarif"
                           value="${specialiste.tarif}"
                           min="0" step="0.01" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent"
                           placeholder="Ex: 200.00">
                    <span class="absolute right-4 top-3 text-gray-500 font-medium">DH</span>
                </div>
                <p class="text-sm text-gray-500 mt-1">Le montant que vous facturez pour une consultation</p>
            </div>

            <div class="mb-6 p-4 bg-blue-50 rounded-lg border border-blue-100">
                <div class="flex items-start">
                    <svg class="w-5 h-5 text-blue-600 mr-2 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                    </svg>
                    <div class="text-sm text-blue-800">
                        <p class="font-semibold mb-1">Informations importantes</p>
                        <ul class="list-disc list-inside space-y-1 text-blue-700">
                            <li>Votre spécialité sera visible par les médecins généralistes</li>
                            <li>Le tarif sera affiché lors des demandes d'expertise</li>
                            <li>Ces modifications prendront effet immédiatement</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="flex justify-end space-x-4">
                <a href="specialist-requests.jsp"
                   class="px-6 py-3 border border-gray-300 rounded-lg text-gray-700 font-medium hover:bg-gray-50 transition-colors">
                    Annuler
                </a>
                <button type="submit"
                        class="px-6 py-3 primary-color text-white rounded-lg font-medium primary-hover transition-colors flex items-center">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                    </svg>
                    Enregistrer les modifications
                </button>
            </div>
        </form>
    </div>

    <div class="mt-6 bg-white rounded-lg shadow-md p-6">
        <h3 class="text-lg font-semibold primary-text mb-4 flex items-center">
            <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
            </svg>
            Besoin d'aide ?
        </h3>
        <div class="text-sm text-gray-600 space-y-2">
            <p><strong>Comment choisir ma spécialité ?</strong> Sélectionnez la spécialité qui correspond à votre domaine d'expertise principal.</p>
            <p><strong>Comment définir mon tarif ?</strong> Indiquez le montant que vous souhaitez facturer pour une consultation d'expertise. Ce tarif sera visible par les médecins généralistes.</p>
            <p><strong>Puis-je modifier ces informations plus tard ?</strong> Oui, vous pouvez revenir sur cette page à tout moment pour mettre à jour votre profil.</p>
        </div>
    </div>
</div>

<script>
    function validateForm() {
        const specialite = document.getElementById('specialite').value;
        const tarif = document.getElementById('tarif').value;

        if (!specialite) {
            alert('Veuillez sélectionner une spécialité');
            return false;
        }

        if (!tarif || parseFloat(tarif) <= 0) {
            alert('Veuillez entrer un tarif valide supérieur à 0');
            return false;
        }

        return true;
    }

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