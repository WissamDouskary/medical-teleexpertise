<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Patients - MediExpert</title>
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
                <a href="" class="text-gray-600 hover:text-primary transition-colors">Logout</a>
            </div>
        </div>
    </div>
</nav>

<main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 md:p-8">
        <div class="flex items-center justify-between mb-6">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-primary/10 rounded-lg flex items-center justify-center">
                    <svg class="w-6 h-6 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                    </svg>
                </div>
                <h1 class="text-2xl font-bold text-gray-900">Liste des Patients</h1>
            </div>
            <span class="text-sm text-gray-500">${patientCount} patients</span>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full">
                <thead>
                <tr class="border-b border-gray-200">
                    <th class="text-left py-3 px-4 text-sm font-semibold text-gray-700">Nom</th>
                    <th class="text-left py-3 px-4 text-sm font-semibold text-gray-700">Prénom</th>
                    <th class="text-left py-3 px-4 text-sm font-semibold text-gray-700">Date de Naissance</th>
                    <th class="text-left py-3 px-4 text-sm font-semibold text-gray-700">Téléphone</th>
                    <th class="text-left py-3 px-4 text-sm font-semibold text-gray-700">N° Sécurité Sociale</th>
                    <th class="text-left py-3 px-4 text-sm font-semibold text-gray-700">Adresse</th>
                    <th class="text-left py-3 px-4 text-sm font-semibold text-gray-700">Status</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${patients}" var="pa">
                <tr class="border-b border-gray-100 hover:bg-gray-50 transition-colors">
                    <td class="py-4 px-4 text-sm text-gray-900">${pa.key.nom}</td>
                    <td class="py-4 px-4 text-sm text-gray-900">${pa.key.prenom}</td>
                    <td class="py-4 px-4 text-sm text-gray-600">${pa.key.dateNaissance}</td>
                    <td class="py-4 px-4 text-sm text-gray-600">${pa.key.telephone}</td>
                    <td class="py-4 px-4 text-sm text-gray-600 font-mono">${pa.key.numSecuriteSociale}</td>
                    <td class="py-4 px-4 text-sm text-gray-600">${pa.key.adresse}</td>
                    <td class="py-4 px-4 text-sm text-gray-600">${pa.value}</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</main>
</body>
</html>