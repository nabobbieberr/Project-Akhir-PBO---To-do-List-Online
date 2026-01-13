<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Login - To-Do List</title>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;800&family=Noto+Sans:wght@400;500;700&display=swap" rel="stylesheet"/>
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
        <script id="tailwind-config">
            tailwind.config = {
                darkMode: "class",
                theme: {
                    extend: {
                        colors: {
                            "primary": "#137fec",
                            "background-light": "#f6f7f8",
                            "background-dark": "#101922",
                        },
                        fontFamily: {
                            "display": ["Inter", "sans-serif"],
                            "body": ["Noto Sans", "sans-serif"]
                        },
                        borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                    },
                },
            }
        </script>
    </head>
    <body class="bg-background-light dark:bg-background-dark text-[#111418] dark:text-white font-display min-h-screen flex flex-col">
        <header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-b-[#f0f2f4] dark:border-b-[#293038] px-10 py-3 bg-white dark:bg-[#101922]">
            <!-- PERBAIKAN: Logo diklik balik ke index.jsp -->
            <div class="flex items-center gap-5 text-[#111418] dark:text-white">
                <a href="index.jsp" class="flex items-center gap-5 hover:opacity-80 transition-opacity">
                    <img src="images/logo2.png" alt="Logo To-Do List" class="h-10 w-10 object-contain"/>
                    <h2 class="text-lg font-bold leading-tight tracking-[-0.015em]">To-Do-List online</h2>
                </a>
            </div>
            <div class="flex items-center gap-4">
                <span class="text-sm font-medium text-[#637588] dark:text-[#93a5b8] hidden sm:block">Don't have an account?</span>
                <a href="register.jsp" class="flex min-w-[84px] items-center justify-center rounded-lg h-9 px-4 bg-primary/10 text-primary text-sm font-bold hover:bg-primary/20 transition-colors">
                    Sign Up
                </a>
            </div>
        </header>

        <div class="flex flex-1 items-center justify-center px-4 py-10">
            <div class="w-full max-w-[480px] flex flex-col gap-6">
                <div class="bg-white dark:bg-[#1a2632] rounded-xl shadow-sm border border-[#e5e7eb] dark:border-[#293038] p-6 sm:p-8">
                    <div class="flex flex-col items-center gap-2 text-center">
                        <h1 class="text-3xl font-extrabold tracking-tight text-[#111418] dark:text-white">Welcome Back</h1>
                        <p class="text-base font-normal text-[#637588] dark:text-[#93a5b8]">Log in to your workspace to stay organized and productive.</p>
                    </div>
                    <% if ("success".equals(request.getParameter("register"))) { %>
                    <div class="bg-green-100 text-green-700 p-3 rounded-lg mb-4 text-sm font-bold text-center">Register berhasil, silakan login</div>
                    <% } %>
                    <% if ("1".equals(request.getParameter("error"))) { %>
                    <div class="bg-red-100 text-red-700 p-3 rounded-lg mb-4 text-sm font-bold text-center">Email atau Password salah</div>
                    <% }%>

                    <form action="<%= request.getContextPath()%>/AuthServlet" method="post" class="flex flex-col gap-4">
                        <div class="space-y-1">
                            <label class="text-sm font-medium">Email Address</label>
                            <input name="email" type="email" required placeholder="you@example.com" class="w-full rounded-lg border px-4 py-2.5 bg-white dark:bg-[#101918]"/>
                        </div>
                        <div class="space-y-1">
                            <label class="text-sm font-medium">Password</label>
                            <input name="password" type="password" required placeholder="******" class="w-full rounded-lg border px-4 py-2.5 bg-white dark:bg-[#101918]"/>
                        </div>
                        <button type="submit" class="mt-2 w-full rounded-lg bg-primary px-4 py-3 text-sm font-bold text-white hover:bg-blue-600 transition">Log In</button>
                    </form>

                    <p class="mt-6 text-center text-sm text-[#637588] dark:text-[#93a5b8]">
                        By continuing, you agree to our Terms of Service.
                    </p>
                    <div class="text-center mt-4">
                        <a href="index.jsp" class="text-sm text-slate-500 hover:text-primary font-medium transition-colors">
                            &larr; Back
                        </a>
                    </div>
                </div>

                <!-- Tambahan Link Balik di Bawah Form (Untuk UX lebih baik) -->
            </div>
        </div>
        <div class="fixed bottom-0 left-0 -z-10 h-64 w-full bg-gradient-to-t from-[#eef2f6] to-transparent dark:from-[#0d141c] dark:to-transparent pointer-events-none"></div>
    </body>
</html>