<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="dark" lang="id">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>To-Do-List online - Atur Hidup Anda</title>
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
                        <a class="text-sm font-medium hover:text-primary transition-colors" href="contact.jsp">Kontak Kami</a>
                        <a class="text-sm font-medium hover:text-primary transition-colors" href="#team">Tentang Kami</a>
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
                <button id="menu-btn" class="md:hidden text-gray-900 dark:text-white">
                    <span class="material-symbols-outlined">menu</span>
                </button>
            </div>
        </header>

        <!-- Main Content Wrapper (ISI HTML YANG KAMU KIRIM TANPA DIUBAH STYLE) -->
        <main class="flex flex-col items-center w-full">
            <!-- Hero Section -->
            <section class="w-full px-4 py-12 md:px-20 md:py-20 lg:py-32 max-w-[1280px]">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                    <!-- Text Content -->
                    <div class="flex flex-col gap-8 order-2 lg:order-1">
                        <div class="flex flex-col gap-4 text-left">
                            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-primary/10 border border-primary/20 w-fit">
                                <span class="w-2 h-2 rounded-full bg-primary"></span>
                                <span class="text-xs font-semibold text-primary uppercase tracking-wide">Produktivitas Level Baru</span>
                            </div>
                            <h1 class="text-4xl md:text-5xl lg:text-6xl font-black leading-tight tracking-[-0.033em] text-gray-900 dark:text-white">
                                Atur Hidup Anda,<br/>
                                <span class="text-transparent bg-clip-text bg-gradient-to-r from-primary to-purple-400">Satu Tugas Sekaligus.</span>
                            </h1>
                            <h2 class="text-lg text-gray-600 dark:text-gray-300 font-normal leading-relaxed max-w-lg">
                                Aplikasi to-do list simpel yang membantu Anda fokus, tetap terorganisir, dan menyelesaikan lebih banyak hal setiap hari tanpa rasa kewalahan.
                            </h2>
                        </div>
                        <div class="flex flex-col sm:flex-row gap-4">
                            <a href="login_form.jsp" class="flex items-center justify-center rounded-lg h-12 px-6 bg-primary text-white text-base font-bold hover:bg-blue-600 transition-all shadow-lg shadow-primary/30 hover:scale-105 active:scale-95">
                                Mulai Sekarang - Gratis 
                            </a>
                            <button class="flex items-center justify-center rounded-lg h-12 px-6 bg-white dark:bg-[#1c2127] border border-gray-200 dark:border-[#3b4754] text-gray-900 dark:text-white text-base font-bold hover:bg-gray-50 dark:hover:bg-[#283039] transition-all">
                                <span class="material-symbols-outlined mr-2 text-[20px]">play_circle</span>
                                Lihat Demo
                            </button>
                        </div>
                        <div class="flex items-center gap-4 text-sm text-gray-500 dark:text-gray-400 pt-2">
                            <div class="flex -space-x-2">
                                <div class="size-8 rounded-full border-2 border-white dark:border-[#101922] bg-gray-300 bg-cover bg-center" style="background-image: url('https://picsum.photos/100');"></div>
                                <div class="size-8 rounded-full border-2 border-white dark:border-[#101922] bg-gray-300 bg-cover bg-center" style="background-image: url('https://picsum.photos/101');"></div>
                                <div class="size-8 rounded-full border-2 border-white dark:border-[#101922] bg-gray-300 bg-cover bg-center" style="background-image: url('https://picsum.photos/102');"></div>
                            </div>
                            <p>10.000+ pengguna telah bergabung</p>
                        </div>
                    </div>
                    <!-- Hero Image -->
                    <div class="order-1 lg:order-2 relative">
                        <div class="absolute -inset-4 bg-gradient-to-r from-primary to-purple-600 rounded-2xl blur-2xl opacity-20 animate-pulse"></div>
                        <div class="relative w-full aspect-[4/3] bg-cover bg-center bg-no-repeat rounded-xl shadow-2xl border border-gray-200 dark:border-[#283039] overflow-hidden" style='background-image:url("https://picsum.photos/800/600");'>
                            <div class="absolute inset-0 bg-gradient-to-t from-[#101922]/80 to-transparent lg:hidden"></div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- About Section -->
            <section id="about" class="w-full px-4 py-20 bg-gray-50 dark:bg-[#0d1218]">
                <div class="max-w-[900px] mx-auto text-center">
                    <h2 class="text-3xl md:text-4xl font-black mb-4">Tentang To-Do-List Online</h2>
                    <p class="text-gray-600 dark:text-gray-300 leading-relaxed">
                        To-Do-List online adalah aplikasi to-do list berbasis web yang dirancang
                        untuk membantu pengguna mengatur tugas harian secara sederhana,
                        cepat, dan efisien. Aplikasi ini dibuat sebagai project pembelajaran
                        pengembangan web berbasis Java (JSP).
                    </p>
                </div>
            </section>

            <!-- Testimoni Section -->
            <section id="testimoni" class="w-full px-4 py-20 bg-blue-50 dark:bg-[#0d1218]">
                <div class="max-w-[1100px] mx-auto text-center">

                    <h2 class="text-3xl font-bold mb-2">Apa Kata Pengguna Kami?</h2>
                    <p class="text-white-500 mb-8">
                        Pengalaman nyata dari pengguna To-Do-List Online
                    </p>

                    <!-- Carousel -->
                    <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">


                            <div class="carousel-item active">
                                <div class="flex flex-col items-center">
                                    <h4 class="font-semibold mt-4">Rafael Saputra</h4>
                                    <span class="text-sm text-white-400">Mahasiswa</span>
                                    <img src="images/rafael.jpg"
                                         class="rounded-full mb-4"
                                         style="width:110px;height:110px;object-fit:cover;">
                                    <p class="text-white-600 italic max-w-2xl">
                                        “Aplikasi ini bikin tugas harian aku jauh lebih rapi.
                                        Sekarang nggak ada lagi yang kelupaan.”
                                    </p>
                                    <br>
                                    <h4 class="font-semibold mt-4">Iput</h4>
                                    <span class="text-sm text-white-400">Freelance</span>
                                </div>
                            </div>


                            <div class="carousel-item">
                                <div class="flex flex-col items-center">
                                    <img src="images/iput.jpg"
                                         class="rounded-full mb-4"
                                         style="width:110px;height:110px;object-fit:cover;">
                                    <p class="text-white-600 italic max-w-2xl">
                                        “Simple tapi powerful. Cocok banget buat freelancer
                                        yang kerja dengan banyak deadline.”
                                    </p>
                                    <br>
                                    <h4 class="font-semibold mt-4">Lunaira Putri</h4>
                                    <span class="text-sm text-white-400">Karyawan</span>
                                </div>
                            </div>

                            <!-- Item 3 -->
                            <div class="carousel-item">
                                <div class="flex flex-col items-center">
                                    <img src="images/lunaira.jpg"
                                         class="rounded-full mb-4"
                                         style="width:110px;height:110px;object-fit:cover;">
                                    <p class="text-white-600 italic max-w-2xl">
                                        “Dipakai satu tim juga enak.
                                        Tampilannya bersih dan nggak ribet.”
                                    </p>

                                </div>
                            </div>

                        </div>
                        </section>

                        <!-- Features Section -->
                        <section class="w-full px-4 py-16 md:py-24 max-w-[1280px] mx-auto" id="features">
                            <div class="flex flex-col gap-12">
                                <div class="flex flex-col items-center text-center gap-4 max-w-[800px] mx-auto">
                                    <h2 class="text-3xl md:text-4xl font-black leading-tight tracking-[-0.033em] text-gray-900 dark:text-white">
                                        Semua yang Anda butuhkan untuk tetap fokus
                                    </h2>
                                    <p class="text-gray-600 dark:text-gray-300 text-lg leading-relaxed">
                                        Kami merancang antarmuka yang bersih agar Anda bisa langsung bekerja tanpa gangguan.
                                    </p>
                                </div>
                                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                                    <div class="group flex flex-col gap-4 rounded-xl border border-gray-200 dark:border-[#3b4754] bg-white dark:bg-[#1c2127] p-8 hover:border-primary/50 transition-colors duration-300">
                                        <div class="size-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary group-hover:bg-primary group-hover:text-white transition-colors duration-300">
                                            <span class="material-symbols-outlined text-[28px]">format_list_bulleted</span>
                                        </div>
                                        <h3 class="text-xl font-bold leading-tight">Buat Daftar Tanpa Batas</h3>
                                        <p class="text-gray-500 dark:text-gray-400 font-normal leading-relaxed">
                                            Organisir pekerjaan, rumah, dan proyek pribadi secara terpisah.
                                        </p>
                                    </div>
                                    <div class="group flex flex-col gap-4 rounded-xl border border-gray-200 dark:border-[#3b4754] bg-white dark:bg-[#1c2127] p-8 hover:border-primary/50 transition-colors duration-300">
                                        <div class="size-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary group-hover:bg-primary group-hover:text-white transition-colors duration-300">
                                            <span class="material-symbols-outlined text-[28px]">bolt</span>
                                        </div>
                                        <h3 class="text-xl font-bold leading-tight">Tambah Tugas Instan</h3>
                                        <p class="text-gray-500 dark:text-gray-400 font-normal leading-relaxed">
                                            Tangkap ide sebelum hilang dengan antarmuka penambahan cepat kami.
                                        </p>
                                    </div>
                                    <div class="group flex flex-col gap-4 rounded-xl border border-gray-200 dark:border-[#3b4754] bg-white dark:bg-[#1c2127] p-8 hover:border-primary/50 transition-colors duration-300">
                                        <div class="size-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary group-hover:bg-primary group-hover:text-white transition-colors duration-300">
                                            <span class="material-symbols-outlined text-[28px]">notifications_active</span>
                                        </div>
                                        <h3 class="text-xl font-bold leading-tight">Tampilan Fleksibel</h3>
                                        <p class="text-gray-500 dark:text-gray-400 font-normal leading-relaxed">
                                            Sesuaikan tampilan sesuai preferensimu.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </section>

                        <!-- Team Section -->
                        <section id="team" class="w-full px-4 py-20 bg-white dark:bg-[#101922]">
                            <div class="max-w-[1100px] mx-auto text-center">

                                <h2 class="text-3xl md:text-4xl font-black mb-4">
                                    Tim Pengembang
                                </h2>
                                <p class="text-gray-600 dark:text-gray-300 mb-12">
                                    Orang-orang di balik pengembangan To-Do-List Online
                                </p>

                                <!-- Team Grid -->
                                <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 gap-8">

                                    <!-- Member 1 -->
                                    <div class="flex flex-col items-center gap-3">
                                        <img src="images/lira.jpeg"
                                             class="w-28 h-28 rounded-full object-cover border-4 border-primary shadow-lg"
                                             alt="Anggota 1">
                                        <h3 class="font-bold text-lg">Lira Liska</h3>
                                        <p class="text-sm text-gray-500 dark:text-gray-400">
                                            Project Leader
                                        </p>
                                    </div>

                                    <!-- Member 2 -->
                                    <div class="flex flex-col items-center gap-3">
                                        <img src="images/meisha.jpeg"
                                             class="w-28 h-28 rounded-full object-cover border-4 border-primary shadow-lg"
                                             alt="Anggota 2">
                                        <h3 class="font-bold text-lg">Meisha Bongi Teluma</h3>
                                        <p class="text-sm text-gray-500 dark:text-gray-400">
                                            Backend Developer
                                        </p>
                                    </div>

                                    <!-- Member 3 -->
                                    <div class="flex flex-col items-center gap-3">
                                        <img src="images/asyifa.jpeg"
                                             class="w-28 h-28 rounded-full object-cover border-4 border-primary shadow-lg"
                                             alt="Anggota 3">
                                        <h3 class="font-bold text-lg">Assyifa Khoirunissa Putri</h3>
                                        <p class="text-sm text-gray-500 dark:text-gray-400">
                                            Frontend Developer
                                        </p>
                                    </div>

                                    <!-- Member 4 -->
                                    <div class="flex flex-col items-center gap-3">
                                        <img src="images/nabil.jpeg"
                                             class="w-28 h-28 rounded-full object-cover border-4 border-primary shadow-lg"
                                             alt="Anggota 4">
                                        <h3 class="font-bold text-lg">Nabib Khalish Alfayadh</h3>
                                        <p class="text-sm text-gray-500 dark:text-gray-400">
                                            UI/UX Designer
                                        </p>
                                    </div>

                                    <!-- Member 5 -->
                                    <div class="flex flex-col items-center gap-3">
                                        <img src="images/rafi.jpeg"
                                             class="w-28 h-28 rounded-full object-cover border-4 border-primary shadow-lg"
                                             alt="Anggota 5">
                                        <h3 class="font-bold text-lg">Rafi Muhammad Ramadhan</h3>
                                        <p class="text-sm text-gray-500 dark:text-gray-400">
                                            Quality Assurance
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </section>  
                        <footer class="w-full bg-white dark:bg-[#101922] border-t border-gray-200 dark:border-[#283039] py-12 px-4">
                            <div class="max-w-[1280px] mx-auto flex flex-col items-center justify-center gap-4 text-center">
                                <div class="flex items-center gap-3 text-gray-900 dark:text-white mb-4">
                                    <span class="text-2xl">📝</span>
                                    <h2 class="text-lg font-bold">To-Do-List online</h2>
                                </div>
                                <p class="text-gray-500 dark:text-gray-400 text-sm">
                                    © 2025 To-Do-List Online (Kelompok 6). Hak Cipta Dilindungi.
                                </p>
                            </div>
                        </footer>
                        <script>
                            const menuBtn = document.getElementById("menu-btn");
                            const mobileMenu = document.getElementById("mobile-menu");
                            menuBtn.addEventListener("click", () => {
                                mobileMenu.classList.toggle("hidden");
                            });
                        </script>
                        </body>
                        </html>