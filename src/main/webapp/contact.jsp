<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="dark" lang="id">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Hubungi Kami - To-Do List Online</title>
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

    <body class="bg-background-light dark:bg-background-dark font-display text-gray-900 dark:text-white min-h-screen flex flex-col overflow-x-hidden">

        <!-- Top Navigation (SAMA DENGAN INDEX) -->
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
                        <a class="text-sm font-medium hover:text-primary transition-colors" href="gallery.jsp">Galeri</a>
                        <a class="text-sm font-medium hover:text-primary transition-colors" href="contact.jsp">Kontak Kami</a>
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

        <!-- Main Content -->
        <main class="flex flex-col items-center w-full">
            <section class="w-full px-4 py-12 md:px-20 md:py-20 lg:py-24 max-w-[1280px]">

                <!-- Page Heading -->
                <div class="flex flex-col gap-4 py-8 text-center md:text-left mx-auto mb-10">
                    <div class="flex flex-col gap-2">
                        <h1 class="text-4xl md:text-5xl lg:text-6xl font-black leading-tight tracking-[-0.033em] text-gray-900 dark:text-white">
                            Hubungi Tim Support Kami
                        </h1>
                        <p class="text-lg text-gray-600 dark:text-gray-300 font-normal leading-relaxed max-w-2xl">
                            Punya pertanyaan tentang fitur, mengalami kendala teknis, atau memiliki saran untuk pengembangan? Kami siap membantu Anda mengatur tugas kuliah dengan lebih baik.
                        </p>
                    </div>
                </div>

                <!-- Content Split: Form & Contact Info -->
                <div class="flex flex-col lg:flex-row gap-8 mt-4">

                    <!-- Contact Form Card (Style disesuaikan agar masuk theme) -->
                    <div class="flex-1 bg-white dark:bg-[#1c2127] rounded-xl border border-gray-200 dark:border-[#283039] p-6 md:p-8 shadow-lg">
                        <form class="flex flex-col gap-6">
                            <!-- Row 1: Name & Email -->
                            <div class="flex flex-col md:flex-row gap-6">
                                <label class="flex flex-col flex-1 gap-2">
                                    <span class="text-gray-900 dark:text-white text-sm font-medium leading-normal">Nama Lengkap</span>
                                    <input class="w-full rounded-lg border px-4 py-2.5 bg-gray-50 dark:bg-[#111418] border-gray-300 dark:border-[#3b4754] focus:ring-2 focus:ring-primary focus:outline-none transition-all" placeholder="Contoh: Budi Santoso" type="text"/>
                                </label>
                                <label class="flex flex-col flex-1 gap-2">
                                    <span class="text-gray-900 dark:text-white text-sm font-medium leading-normal">Alamat Email</span>
                                    <input class="w-full rounded-lg border px-4 py-2.5 bg-gray-50 dark:bg-[#111418] border-gray-300 dark:border-[#3b4754] focus:ring-2 focus:ring-primary focus:outline-none transition-all" placeholder="budi@mahasiswa.ac.id" type="email"/>
                                </label>
                            </div>

                            <!-- Row 2: Subject -->
                            <label class="flex flex-col gap-2">
                                <span class="text-gray-900 dark:text-white text-sm font-medium leading-normal">Subjek</span>
                                <div class="relative">
                                    <select class="w-full rounded-lg border px-4 py-2.5 bg-gray-50 dark:bg-[#111418] border-gray-300 dark:border-[#3b4754] focus:ring-2 focus:ring-primary focus:outline-none appearance-none pr-10">
                                        <option disabled="" selected="" value="">Pilih topik (mis. Masalah Teknis, Saran)</option>
                                        <option value="technical">Masalah Teknis</option>
                                        <option value="billing">Pertanyaan Akun</option>
                                        <option value="suggestion">Saran &amp; Masukan</option>
                                        <option value="other">Lainnya</option>
                                    </select>
                                    <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-gray-500 dark:text-gray-400">
                                        <span class="material-symbols-outlined text-xl">expand_more</span>
                                    </div>
                                </div>
                            </label>

                            <!-- Row 3: Message -->
                            <label class="flex flex-col gap-2">
                                <span class="text-gray-900 dark:text-white text-sm font-medium leading-normal">Pesan Anda</span>
                                <textarea class="w-full rounded-lg border px-4 py-2.5 bg-gray-50 dark:bg-[#111418] border-gray-300 dark:border-[#3b4754] focus:ring-2 focus:ring-primary focus:outline-none min-h-[160px] transition-all" placeholder="Tuliskan detail pertanyaan atau saran Anda di sini..."></textarea>
                            </label>

                            <!-- Submit Button -->
                            <div class="pt-2">
                                <button class="flex w-full md:w-auto md:min-w-[200px] cursor-pointer items-center justify-center overflow-hidden rounded-lg h-12 px-6 bg-primary hover:bg-blue-600 transition-colors text-white text-base font-bold leading-normal tracking-[0.015em] shadow-md hover:shadow-lg" type="button">
                                    <span class="flex items-center gap-2">
                                        <span class="material-symbols-outlined text-[20px]">send</span>
                                        <span>Kirim Pesan</span>
                                    </span>
                                </button>
                            </div>
                        </form>
                    </div>

                    <!-- Info Sidebar -->
                    <div class="lg:w-80 flex flex-col gap-6">
                        <!-- Info Card -->
                        <div class="bg-white dark:bg-[#1c2127] rounded-xl border border-gray-200 dark:border-[#283039] p-6">
                            <h3 class="text-gray-900 dark:text-white text-lg font-bold mb-4">Info Kontak Lain</h3>
                            <div class="flex flex-col gap-4">
                                <div class="flex items-start gap-3">
                                    <div class="mt-1 text-primary">
                                        <span class="material-symbols-outlined">mail</span>
                                    </div>
                                    <div>
                                        <p class="text-gray-500 dark:text-gray-400 text-xs font-medium uppercase tracking-wider">Email</p>
                                        <p class="text-gray-900 dark:text-white text-sm font-medium">@ToDoList.id</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-3">
                                    <div class="mt-1 text-primary">
                                        <span class="material-symbols-outlined">location_on</span>
                                    </div>
                                    <div>
                                        <p class="text-gray-500 dark:text-gray-400 text-xs font-medium uppercase tracking-wider">Kantor</p>
                                        <p class="text-gray-900 dark:text-white text-sm font-medium">Jakarta, Indonesia</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-3">
                                    <div class="mt-1 text-primary">
                                        <span class="material-symbols-outlined">schedule</span>
                                    </div>
                                    <div>
                                        <p class="text-gray-500 dark:text-gray-400 text-xs font-medium uppercase tracking-wider">Jam Operasional</p>
                                        <p class="text-gray-900 dark:text-white text-sm font-medium">Senin - Jumat, 09:00 - 17:00</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- FAQ Teaser -->
                        <div class="bg-primary/10 rounded-xl border border-primary/20 p-6">
                            <h3 class="text-gray-900 dark:text-white text-lg font-bold mb-2">Butuh jawaban cepat?</h3>
                            <p class="text-gray-600 dark:text-gray-300 text-sm mb-4">Cek halaman FAQ kami untuk menemukan jawaban atas pertanyaan umum.</p>
                            <a class="text-primary text-sm font-bold hover:underline flex items-center gap-1" href="index.jsp#features">
                                Lihat FAQ
                                <span class="material-symbols-outlined text-sm">arrow_forward</span>
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

<!-- Footer (SAMA DENGAN INDEX) -->
<footer class="w-full bg-white dark:bg-[#101922] border-t border-gray-200 dark:border-[#283039] py-12 px-4">
    <div class="max-w-[1280px] mx-auto flex flex-col md:flex-row justify-between items-start gap-12">
        <div class="flex flex-col gap-4 max-w-xs">
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
                Platform manajemen tugas sederhana untuk membantu kamu lebih terorganisir setiap hari.
            </p>
        </div>

        <div class="flex flex-col gap-4">
            <h3 class="text-gray-900 dark:text-white font-bold">Perusahaan</h3>
            <a href="index.jsp#team" class="text-gray-500 dark:text-gray-400 text-sm hover:text-primary transition-colors" href="#">Tentang Kami</a>
            <a class="text-gray-500 dark:text-gray-400 text-sm hover:text-primary transition-colors" href="contact.jsp">Kontak Kami</a>
        </div>
    </div>

    <div class="max-w-[1280px] mx-auto mt-12 pt-8 border-t border-gray-200 dark:border-[#283039] flex flex-col md:flex-row justify-between items-center gap-4">
        <p class="text-gray-500 dark:text-gray-400 text-sm">© 2025 To-Do-List Online (Kelompok 6). Hak Cipta Dilindungi.</p>
        <div class="flex gap-4">
            <a class="text-gray-400 hover:text-primary transition-colors" href="#"><span class="material-symbols-outlined text-[20px]">public</span></a>
            <a class="text-gray-400 hover:text-primary transition-colors" href="#"><span class="material-symbols-outlined text-[20px]">mail</span></a>
        </div>
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