<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="dark" lang="id">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Hubungi Kami - To-Do List</title>
        <!-- (Paste seluruh head, style, dan body HTML pertama kamu di sini persis seperti aslinya) -->
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
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
                            "display": ["Inter", "sans-serif"]
                        },
                        borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                    },
                },
            }
        </script>
        <style>
            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            }
        </style>
    </head>
    <body class="bg-background-light dark:bg-background-dark font-display text-slate-900 dark:text-white min-h-screen flex flex-col overflow-x-hidden">
        <!-- Top Navigation -->
        <header class="flex items-center justify-between whitespace-nowrap border-b border-solid border-b-[#283039] px-6 lg:px-10 py-3 bg-[#111418] dark:bg-[#111418]">
            <div class="flex items-center gap-4">
                <a href="index.jsp"><img src="images/logo2.png" alt="Logo" class="h-8 w-auto"/></a>
                <h2 class="text-lg font-bold text-white">To-Do-List Online</h2>
            </div>
        </header>
        <!-- Main Content -->
        <main class="flex-1 flex flex-col items-center py-10 px-4 md:px-10 lg:px-40">
            <div class="layout-content-container flex flex-col max-w-[960px] w-full flex-1">
                <!-- Page Heading -->
                <div class="flex flex-col gap-4 py-8 text-center md:text-left mx-auto">
                    <div class="flex flex-col gap-2">
                        <h1 class="text-white text-4xl md:text-5xl font-black leading-tight tracking-[-0.033em]">Hubungi Tim Support Kami</h1>
                        <p class="text-[#9dabb9] text-lg font-normal leading-normal max-w-2xl">
                            Punya pertanyaan tentang fitur, mengalami kendala teknis, atau memiliki saran untuk pengembangan? Kami siap membantu Anda mengatur tugas kuliah dengan lebih baik.
                        </p>
                    </div>
                </div>
                <!-- Content Split: Form & Contact Info -->
                <div class="flex flex-col lg:flex-row gap-8 mt-4">
                    <!-- Contact Form Card -->
                    <div class="flex-1 bg-[#1c2127] rounded-xl border border-[#283039] p-6 md:p-8 shadow-lg">
                        <form class="flex flex-col gap-6">
                            <!-- Row 1: Name & Email -->
                            <div class="flex flex-col md:flex-row gap-6">
                                <label class="flex flex-col flex-1 gap-2">
                                    <span class="text-white text-sm font-medium leading-normal">Nama Lengkap</span>
                                    <input class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-white placeholder:text-[#9dabb9] focus:outline-0 focus:ring-1 focus:ring-primary border border-[#3b4754] bg-[#111418] focus:border-primary h-12 px-4 text-base font-normal leading-normal transition-all" placeholder="Contoh: Budi Santoso" type="text"/>
                                </label>
                                <label class="flex flex-col flex-1 gap-2">
                                    <span class="text-white text-sm font-medium leading-normal">Alamat Email</span>
                                    <input class="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-white placeholder:text-[#9dabb9] focus:outline-0 focus:ring-1 focus:ring-primary border border-[#3b4754] bg-[#111418] focus:border-primary h-12 px-4 text-base font-normal leading-normal transition-all" placeholder="budi@mahasiswa.ac.id" type="email"/>
                                </label>
                            </div>
                            <!-- Row 2: Subject -->
                            <label class="flex flex-col gap-2">
                                <span class="text-white text-sm font-medium leading-normal">Subjek</span>
                                <div class="relative">
                                    <select class="form-select flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-white placeholder:text-[#9dabb9] focus:outline-0 focus:ring-1 focus:ring-primary border border-[#3b4754] bg-[#111418] focus:border-primary h-12 px-4 text-base font-normal leading-normal appearance-none transition-all pr-10">
                                        <option disabled="" selected="" value="">Pilih topik (mis. Masalah Teknis, Saran)</option>
                                        <option value="technical">Masalah Teknis</option>
                                        <option value="billing">Pertanyaan Akun</option>
                                        <option value="suggestion">Saran &amp; Masukan</option>
                                        <option value="other">Lainnya</option>
                                    </select>
                                    <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-[#9dabb9]">
                                        <span class="material-symbols-outlined text-xl">expand_more</span>
                                    </div>
                                </div>
                            </label>
                            <!-- Row 3: Message -->
                            <label class="flex flex-col gap-2">
                                <span class="text-white text-sm font-medium leading-normal">Pesan Anda</span>
                                <textarea class="form-textarea flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-white placeholder:text-[#9dabb9] focus:outline-0 focus:ring-1 focus:ring-primary border border-[#3b4754] bg-[#111418] focus:border-primary min-h-[160px] p-4 text-base font-normal leading-normal transition-all" placeholder="Tuliskan detail pertanyaan atau saran Anda di sini..."></textarea>
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
                        <div class="bg-[#1c2127] rounded-xl border border-[#283039] p-6">
                            <h3 class="text-white text-lg font-bold mb-4">Info Kontak Lain</h3>
                            <div class="flex flex-col gap-4">
                                <div class="flex items-start gap-3">
                                    <div class="mt-1 text-primary">
                                        <span class="material-symbols-outlined">mail</span>
                                    </div>
                                    <div>
                                        <p class="text-[#9dabb9] text-xs font-medium uppercase tracking-wider">Email</p>
                                        <p class="text-white text-sm font-medium">@ToDoList.id</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-3">
                                    <div class="mt-1 text-primary">
                                        <span class="material-symbols-outlined">location_on</span>
                                    </div>
                                    <div>
                                        <p class="text-[#9dabb9] text-xs font-medium uppercase tracking-wider">Kantor</p>
                                        <p class="text-white text-sm font-medium">Jakarta, Indonesia</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-3">
                                    <div class="mt-1 text-primary">
                                        <span class="material-symbols-outlined">schedule</span>
                                    </div>
                                    <div>
                                        <p class="text-[#9dabb9] text-xs font-medium uppercase tracking-wider">Jam Operasional</p>
                                        <p class="text-white text-sm font-medium">Senin - Jumat, 09:00 - 17:00</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- FAQ Teaser -->
                        <div class="bg-primary/10 rounded-xl border border-primary/20 p-6">
                            <h3 class="text-white text-lg font-bold mb-2">Butuh jawaban cepat?</h3>
                            <p class="text-[#9dabb9] text-sm mb-4">Cek halaman FAQ kami untuk menemukan jawaban atas pertanyaan umum.</p>
                            <a class="text-primary text-sm font-bold hover:underline flex items-center gap-1" href="#">
                                Lihat FAQ
                                <span class="material-symbols-outlined text-sm">arrow_forward</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- Simple Footer -->
        <footer class="border-t border-[#283039] py-8 bg-[#111418] mt-10">
            <div class="flex flex-col items-center justify-center gap-4 px-10 text-center">
                <div class="flex gap-4 text-[#9dabb9]">
                    <a class="hover:text-white transition-colors" href="#"><span class="material-symbols-outlined">api</span></a>
                    <a class="hover:text-white transition-colors" href="#"><span class="material-symbols-outlined">article</span></a>
                    <a class="hover:text-white transition-colors" href="#"><span class="material-symbols-outlined">help</span></a> 
                    <p class="text-[#9dabb9] text-sm">© 2025 To-Do List Online. Hak Cipta Dilindungi.</p>
                </div>
        </footer>
    </body></html>