<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" class="light">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register - To-Do List</title>
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
                    }
                }
            }
        </script>
    </head>
    <body class="bg-background-light dark:bg-background-dark text-[#111418] dark:text-white font-display min-h-screen flex flex-col">

        <!-- Header: Logo clickable to Home -->
        <header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-b-[#f0f2f4] dark:border-b-[#293038] px-10 py-3 bg-white dark:bg-[#101922]">
            <a href="index.jsp" class="flex items-center gap-5 text-[#111418] dark:text-white hover:opacity-80 transition-opacity">
                <img src="images/logo2.png" alt="Logo To-Do List" class="h-10 w-10 object-contain"/>
                <h2 class="text-lg font-bold leading-tight tracking-[-0.015em]">To-Do-List online</h2>
            </a>
            <div class="flex items-center gap-4">
                <span class="text-sm font-medium text-[#637588] dark:text-[#93a5b8] hidden sm:block">Already have an account?</span>
                <a href="login_form.jsp" class="flex min-w-[84px] items-center justify-center rounded-lg h-9 px-4 bg-primary/10 text-primary text-sm font-bold hover:bg-primary/20 transition-colors">
                    Login
                </a>
            </div>
        </header>

        <!-- Main Area: Centered Card -->
        <div class="flex flex-1 items-center justify-center px-4 py-10">
            <div class="bg-white dark:bg-[#1a2632] p-8 rounded-xl shadow-lg w-full max-w-md">

                <!-- Title & Subtitle Inside Card -->
                <div class="flex flex-col items-center gap-2 text-center mb-6">
                    <h1 class="text-2xl font-bold">Create New Account</h1>
                    <p class="text-base font-normal text-[#637588] dark:text-[#93a5b8]">Create your workspace to stay organized and productive.</p>
                </div>

                <% if ("exists".equals(request.getParameter("error"))) { %>
                <div class="bg-red-100 text-red-700 p-3 rounded mb-4 text-center text-sm font-medium">Email is already registered!</div>
                <% }%>

                <form action="<%= request.getContextPath()%>/RegisterServlet" method="post" class="flex flex-col gap-4">
                    <label class="text-sm font-medium">Name</label>
                    <input type="text" name="name" placeholder="Full Name" required
                           class="w-full rounded-lg border px-4 py-2.5 focus:ring-2 focus:ring-primary focus:outline-none bg-white dark:bg-[#101918]"/>
                    <label class="text-sm font-medium">Email Address</label>
                    <input type="email" name="email" placeholder="Email" required
                           class="w-full rounded-lg border px-4 py-2.5 focus:ring-2 focus:ring-primary focus:outline-none bg-white dark:bg-[#101918]"/>
                    <label class="text-sm font-medium">Password</label>
                    <input type="password" name="password" placeholder="Password" required
                           class="w-full rounded-lg border px-4 py-2.5 focus:ring-2 focus:ring-primary focus:outline-none bg-white dark:bg-[#101918]"/>

                    <button type="submit" 
                            class="w-full bg-primary text-white py-3 rounded-lg font-bold text-sm hover:bg-blue-700 transition">Sign Up</button>
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
            <!-- Bottom Back Button Removed -->
        </div>

        <div class="fixed bottom-0 left-0 -z-10 h-64 w-full bg-gradient-to-t from-[#eef2f6] to-transparent dark:from-[#0d141c] dark:to-transparent pointer-events-none"></div>
    </body>
</html>