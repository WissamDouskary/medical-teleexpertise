<%@ page import="com.teleexpertise.enums.Role" %>
<%@ page import="com.teleexpertise.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    User user = (User) session.getAttribute("user");

    if (user != null && user.getRole() != null) {
        if (user.getRole().equals(Role.INFIRMIER)) {
            response.sendRedirect("addPatient.jsp");
            return;
        } else if (user.getRole().equals(Role.GENERALISTE)) {
            response.sendRedirect("patients");
            return;
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - MediConnect</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#4A1D4A',
                        secondary: '#6B46C1',
                        accent: '#8B5CF6',
                        neutral: '#F8F9FA',
                        'neutral-dark': '#2D3748',
                        'text-primary': '#1A202C',
                        'text-secondary': '#4A5568',
                    },
                    fontFamily: {
                        sans: ['Inter', 'system-ui', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
    </style>
</head>
<body class="bg-gradient-to-br from-neutral via-white to-purple-50 font-sans antialiased min-h-screen flex flex-col">
<nav class="bg-white border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-16">
            <a href="index.jsp" class="flex items-center gap-2">
                <svg class="w-8 h-8 text-primary" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 2L2 7v10c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-10-5zm0 18c-3.31 0-6-2.69-6-6s2.69-6 6-6 6 2.69 6 6-2.69 6-6 6zm-1-10h2v6h-2zm0-4h2v2h-2z"/>
                </svg>
                <span class="text-xl font-semibold text-primary">MediConnect</span>
            </a>
            <a href="index.jsp" class="text-sm font-medium text-text-secondary hover:text-secondary transition-colors">
                ← Back to Home
            </a>
        </div>
    </div>
</nav>

<div class="flex-1 flex items-center justify-center px-4 py-12">
    <div class="w-full max-w-md">
        <div class="bg-white rounded-2xl shadow-xl border border-gray-200 p-8 sm:p-10">
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-text-primary mb-2">Welcome Back</h1>
                <p class="text-text-secondary">Sign in to access your medical dashboard</p>
            </div>

            <form action="login" method="POST" class="space-y-6">
                <div>
                    <label for="email" class="block text-sm font-medium text-text-primary mb-2">
                        Email Address
                    </label>
                    <input
                            type="email"
                            id="email"
                            name="email"
                            required
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-secondary focus:border-transparent transition-all outline-none"
                            placeholder="doctor@hospital.com"
                    />
                </div>

                <div>
                    <div class="flex items-center justify-between mb-2">
                        <label for="password" class="block text-sm font-medium text-text-primary">
                            Password
                        </label>
                        <a href="#" class="text-sm font-medium text-secondary hover:text-primary transition-colors">
                            Forgot?
                        </a>
                    </div>
                    <input
                            type="password"
                            id="password"
                            name="password"
                            required
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-secondary focus:border-transparent transition-all outline-none"
                            placeholder="Enter your password"
                    />
                </div>

                <button
                        type="submit"
                        class="w-full bg-primary text-white font-medium py-3.5 rounded-lg hover:bg-opacity-90 transition-all shadow-lg hover:shadow-xl"
                >
                    Sign In
                </button>
            </form>

            <c:if test="${not empty error}">
                <p style="color:red">${error}</p>
            </c:if>

        </div>

        <div class="mt-6 text-center">
            <p class="text-xs text-text-secondary flex items-center justify-center gap-2">
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4zm0 10.99h7c-.53 4.12-3.28 7.79-7 8.94V12H5V6.3l7-3.11v8.8z"/>
                </svg>
                HIPAA Compliant & Encrypted
            </p>
        </div>
    </div>
</div>
</body>
</html>