<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="dark" lang="id">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Galeri - To-Do List Online</title>
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&amp;family=Noto+Sans:wght@400;500;700;900&amp;display=swap" rel="stylesheet"/>
        <!-- Material Symbols -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
        <!-- Theme Configuration -->
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
                            "body": ["Inter", "sans-serif"],
                        },
                        borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                    },
                },
            }
        </script>
        <style>
            html {
                scroll-behavior: smooth;
            }
            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            }
        </style>
    </head>
    <body class="bg-background-light dark:bg-background-dark font-display text-gray-900 dark:text-white overflow-x-hidden">

        <!-- Top Navigation -->
        <header class="sticky top-0 z-50 w-full border-b border-gray-200 dark:border-[#283039] bg-white/80 dark:bg-[#101922]/90 backdrop-blur-md">
            <div class="px-4 md:px-10 py-3 flex items-center justify-between max-w-[1280px] mx-auto">
                <div class="flex items-center gap-4 text-gray-900 dark:text-white">
                    <div class="flex items-center gap-3">
                        <img src="images/logo2.png" alt="Logo To-Do-List" class="h-10 md:h-16 w-auto"/>
                    </div>
                    <h2 class="text-lg font-bold leading-tight tracking-[-0.010em]">To-Do-List Online</h2>
                </div>
                <div id="mobile-menu" class="hidden md:flex flex-1 justify-end gap-8 items-center">
                    <nav class="flex items-center gap-9">
                        <a class="text-sm font-medium hover:text-primary transition-colors" href="index.jsp">Beranda</a>
                        <a class="text-sm font-medium hover:text-primary transition-colors" href="contact.jsp">Kontak Kami</a>
                        <a class="text-sm font-bold text-primary" href="gallery.jsp">Galeri</a>
                        <a class="text-sm font-medium hover:text-primary transition-colors" href="index.jsp#team">Tentang Kami</a>
                    </nav>
                    <div class="flex gap-3">
                        <a href="login_form.jsp" class="flex min-w-[84px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-10 px-4 bg-transparent border border-gray-300 dark:border-[#3b4754] text-sm font-bold hover:bg-gray-100 dark:hover:bg-[#1c2127] transition-colors">
                            <span class="truncate">Masuk</span>
                        </a>
                        <a href="login_form.jsp" class="flex min-w-[84px] items-center justify-center rounded-lg h-10 px-4 bg-primary text-white text-sm font-bold hover:bg-blue-600 transition-colors shadow-lg">
                            Mulai Sekarang
                        </a>
                    </div>
                </div>
                <!-- Mobile Menu Icon -->
                <button id="menu-btn" class="md:hidden text-gray-900 dark:text-white">
                    <span class="material-symbols-outlined">menu</span>
                </button>
            </div>
        </header>

        <!-- Main Content Wrapper -->
        <main class="flex flex-col items-center w-full">
            <!-- Gallery Header -->
            <section class="w-full px-4 py-12 md:px-20 md:py-20 lg:py-24 max-w-[1280px]">
                <div class="flex flex-col items-center text-center gap-4 mb-12">
                    <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-primary/10 border border-primary/20 w-fit">
                        <span class="w-2 h-2 rounded-full bg-primary"></span>
                        <span class="text-xs font-semibold text-primary uppercase tracking-wide">Dokumentasi</span>
                    </div>
                    <h1 class="text-4xl md:text-5xl lg:text-6xl font-black leading-tight tracking-[-0.033em] text-gray-900 dark:text-white">
                        Galeri Project
                    </h1>
                    <p class="text-lg text-gray-600 dark:text-gray-300 font-normal leading-relaxed max-w-2xl">
                        Potretan antarmuka pengguna (UI) dan fitur-fitur unggulan yang ada di dalam aplikasi To-Do List Online.
                    </p>
                </div>

                <!-- Gallery Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

                    <!-- Item 1: Login Page -->
                    <div class="group relative rounded-2xl overflow-hidden shadow-lg border border-gray-200 dark:border-[#283039] bg-white dark:bg-[#1c2127]">
                        <div class="aspect-video w-full overflow-hidden">
                            <img src="images/login.png" alt="Halaman Login" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105">
                        </div>
                        <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col justify-end p-6">
                            <h3 class="text-white text-xl font-bold mb-1">Halaman Login</h3>
                            <p class="text-white/80 text-sm">Antarmuka masuk yang bersih dan simpel.</p>
                        </div>
                    </div>

                    <!-- Item 2: Dashboard User -->
                    <div class="group relative rounded-2xl overflow-hidden shadow-lg border border-gray-200 dark:border-[#283039] bg-white dark:bg-[#1c2127]">
                        <div class="aspect-video w-full overflow-hidden">
                            <img src="images/dashboard.png" alt="Dashboard User" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105">
                        </div>
                        <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col justify-end p-6">
                            <h3 class="text-white text-xl font-bold mb-1">Dashboard Pengguna</h3>
                            <p class="text-white/80 text-sm">Kelola tugas dengan tabel responsif dan kartu statistik.</p>
                        </div>
                    </div>

                    <!-- Item 3: Calendar View -->
                    <div class="group relative rounded-2xl overflow-hidden shadow-lg border border-gray-200 dark:border-[#283039] bg-white dark:bg-[#1c2127]">
                        <div class="aspect-video w-full overflow-hidden">
                            <img src="images/kalender.png" alt="Calendar View" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105">
                        </div>
                        <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col justify-end p-6">
                            <h3 class="text-white text-xl font-bold mb-1">Tampilan Kalender</h3>
                            <p class="text-white/80 text-sm">Visualisasi deadline tugas dalam format kalender bulanan.</p>
                        </div>
                    </div>

                    <!-- Item 4: Admin Dashboard -->
                    <div class="group relative rounded-2xl overflow-hidden shadow-lg border border-gray-200 dark:border-[#283039] bg-white dark:bg-[#1c2127]">
                        <div class="aspect-video w-full overflow-hidden">
                            <img src="images/admin.png" alt="Admin Dashboard" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105">
                        </div>
                        <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col justify-end p-6">
                            <h3 class="text-white text-xl font-bold mb-1">Admin Panel</h3>
                            <p class="text-white/80 text-sm">Manajemen pengguna dan statistik keseluruhan sistem.</p>
                        </div>
                    </div>

                    <!-- Item 5: Dark Mode -->
                    <div class="group relative rounded-2xl overflow-hidden shadow-lg border border-gray-200 dark:border-[#283039] bg-white dark:bg-[#1c2127]">
                        <div class="aspect-video w-full overflow-hidden">
                            <img src="images/create.png" alt="Dark Mode" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105">
                        </div>
                        <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col justify-end p-6">
                            <h3 class="text-white text-xl font-bold mb-1">Create Task</h3>
                            <p class="text-white/80 text-sm">User dapat membuat Task Tanpa batasan apapun.</p>
                        </div>
                    </div>

                    <!-- Item 6: Mobile Responsive -->
                    <div class="group relative rounded-2xl overflow-hidden shadow-lg border border-gray-200 dark:border-[#283039] bg-white dark:bg-[#1c2127]">
                        <div class="aspect-video w-full overflow-hidden">
                            <img src="images/update.png" alt="Mobile View" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105">
                        </div>
                        <div class="absolute inset-0 bg-gradient-to-t from-black/80 via-black/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col justify-end p-6">
                            <h3 class="text-white text-xl font-bold mb-1">Update Task</h3>
                            <p class="text-white/80 text-sm">User dapat Mengupdate Task Tanpa batasan apapun.</p>
                        </div>
                    </div>

                </div>
            </section>

            <!-- Footer Sama Dengan Index -->
            <footer class="w-full bg-white dark:bg-[#101922] border-t border-gray-200 dark:border-[#283039] py-12 px-4">
                <div class="max-w-[1280px] mx-auto flex flex-col items-center justify-center gap-4 text-center">
                    <div class="flex items-center gap-3 text-gray-900 dark:text-white mb-4">
                        <div class="flex items-center justify-center size-6 bg-primary rounded text-white">
                        </div>
                        <img 
                            src="images/logo2.png"
                            style="width:100px; height:auto;"
                            alt="Logo To-Do List"
                            />
                        <h2 class="text-lg font-bold">To-Do-List online</h2>
                    </div>
                    <p class="text-gray-500 dark:text-gray-400 text-sm">
                        © 2025 To-Do-List Online (Kelompok 6). Hak Cipta Dilindungi.
                    </p>
                </div>
            </footer>
        </main>
        <script>
            const menuBtn = document.getElementById("menu-btn");
            const mobileMenu = document.getElementById("mobile-menu");
            menuBtn.addEventListener("click", () => {
                mobileMenu.classList.toggle("hidden");
            });
        </script>
    </body>
</html>