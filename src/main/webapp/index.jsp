<%@ page import="com.teleexpertise.model.User" %>
<%@ page import="com.teleexpertise.enums.Role" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
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
    <title>MediConnect - Medical Teleexpertise Platform</title>
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
<body class="bg-neutral font-sans text-text-primary antialiased">
<nav class="bg-white border-b border-gray-200 sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-16">
            <div class="flex items-center gap-2">
                <svg class="w-8 h-8 text-primary" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 2L2 7v10c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-10-5zm0 18c-3.31 0-6-2.69-6-6s2.69-6 6-6 6 2.69 6 6-2.69 6-6 6zm-1-10h2v6h-2zm0-4h2v2h-2z"/>
                </svg>
                <span class="text-xl font-semibold text-primary">MediConnect</span>
            </div>

            <div class="flex items-center gap-3">
                <a href="login.jsp" class="text-sm font-medium text-white bg-primary hover:bg-opacity-90 transition-all px-5 py-2.5 rounded-lg">
                    Login
                </a>
            </div>
        </div>
    </div>
</nav>
<section class="relative overflow-hidden bg-gradient-to-br from-neutral via-white to-purple-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20 lg:py-32">
        <div class="text-center max-w-4xl mx-auto">
            <div class="inline-block mb-4 px-4 py-1.5 bg-purple-100 text-primary text-sm font-medium rounded-full">
                Trusted by Healthcare Professionals Worldwide
            </div>
            <h1 class="text-4xl sm:text-5xl lg:text-6xl font-bold text-text-primary mb-6 leading-tight text-balance">
                Infrastructure to Power the Future of Healthcare
            </h1>
            <p class="text-lg sm:text-xl text-text-secondary mb-8 leading-relaxed max-w-2xl mx-auto text-pretty">
                Connect with medical experts instantly. Secure consultations, real-time collaboration, and seamless integration with your healthcare workflow.
            </p>
            <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
                <a href="login.jsp" class="w-full sm:w-auto bg-primary text-white font-medium px-8 py-3.5 rounded-lg hover:bg-opacity-90 transition-all shadow-lg hover:shadow-xl">
                    Get a Demo
                </a>
                <button class="w-full sm:w-auto bg-white text-primary font-medium px-8 py-3.5 rounded-lg border-2 border-primary hover:bg-purple-50 transition-all">
                    Explore Platform →
                </button>
            </div>
        </div>
    </div>
</section>

<section class="py-20 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-3xl sm:text-4xl font-bold text-text-primary mb-4">Expertise at Every Step</h2>
            <p class="text-lg text-text-secondary max-w-2xl mx-auto">
                We believe in healthcare's potential to improve lives, which means making expert consultation accessible for everyone.
            </p>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
            <div class="bg-neutral border border-gray-200 rounded-2xl p-8 hover:shadow-lg transition-shadow">
                <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center mb-6">
                    <svg class="w-6 h-6 text-secondary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-text-primary mb-3">Connect</h3>
                <p class="text-text-secondary leading-relaxed">
                    Instantly connect with specialists across multiple disciplines for expert second opinions and consultations.
                </p>
            </div>

            <div class="bg-neutral border border-gray-200 rounded-2xl p-8 hover:shadow-lg transition-shadow">
                <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center mb-6">
                    <svg class="w-6 h-6 text-secondary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-text-primary mb-3">Collaborate</h3>
                <p class="text-text-secondary leading-relaxed">
                    Share medical records securely and collaborate in real-time with encrypted communication channels.
                </p>
            </div>

            <div class="bg-neutral border border-gray-200 rounded-2xl p-8 hover:shadow-lg transition-shadow">
                <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center mb-6">
                    <svg class="w-6 h-6 text-secondary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                    </svg>
                </div>
                <h3 class="text-xl font-semibold text-text-primary mb-3">Accelerate</h3>
                <p class="text-text-secondary leading-relaxed">
                    Reduce diagnosis time and improve patient outcomes with rapid expert consultation and decision support.
                </p>
            </div>
        </div>
    </div>
</section>

<section class="py-20 bg-primary text-white">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 class="text-3xl sm:text-4xl font-bold mb-6">Ready to Transform Your Healthcare Practice?</h2>
        <p class="text-lg text-purple-100 mb-8 leading-relaxed">
            Join thousands of healthcare professionals using MediConnect for expert consultations.
        </p>
        <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
            <a href="login.jsp" class="w-full sm:w-auto bg-white text-primary font-medium px-8 py-3.5 rounded-lg hover:bg-gray-100 transition-all">
                Get Started Today
            </a>
            <button class="w-full sm:w-auto bg-transparent text-white font-medium px-8 py-3.5 rounded-lg border-2 border-white hover:bg-white hover:text-primary transition-all">
                Contact Sales
            </button>
        </div>
    </div>
</section>

<footer class="bg-neutral-dark text-gray-300 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid md:grid-cols-4 gap-8 mb-8">
            <div>
                <div class="flex items-center gap-2 mb-4">
                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                        <path d="M12 2L2 7v10c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-10-5z"/>
                    </svg>
                    <span class="text-lg font-semibold text-white">MediConnect</span>
                </div>
                <p class="text-sm text-gray-400">Connecting healthcare professionals worldwide.</p>
            </div>
            <div>
                <h4 class="font-semibold text-white mb-3">Platform</h4>
                <ul class="space-y-2 text-sm">
                    <li><a href="#" class="hover:text-white transition-colors">Features</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">Security</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">Integrations</a></li>
                </ul>
            </div>
            <div>
                <h4 class="font-semibold text-white mb-3">Company</h4>
                <ul class="space-y-2 text-sm">
                    <li><a href="#" class="hover:text-white transition-colors">About</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">Careers</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">Contact</a></li>
                </ul>
            </div>
            <div>
                <h4 class="font-semibold text-white mb-3">Legal</h4>
                <ul class="space-y-2 text-sm">
                    <li><a href="#" class="hover:text-white transition-colors">Privacy</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">Terms</a></li>
                    <li><a href="#" class="hover:text-white transition-colors">HIPAA Compliance</a></li>
                </ul>
            </div>
        </div>
        <div class="border-t border-gray-700 pt-8 text-sm text-gray-400 text-center">
            <p>&copy; 2025 MediConnect. All rights reserved.</p>
        </div>
    </div>
</footer>
</body>
</html>