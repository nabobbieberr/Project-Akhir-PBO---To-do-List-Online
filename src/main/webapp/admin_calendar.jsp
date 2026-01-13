<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id" class="light">
    <head>
        <meta charset="UTF-8">
        <title>Kalender Admin | To-Do List</title>
        <!-- ... Copy semua script css dan head yang sama ... -->
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
        <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
        <script>
            tailwind.config = {
                darkMode: 'class',
                theme: {
                    extend: {
                        fontFamily: {sans: ['Plus Jakarta Sans', 'sans-serif']},
                        colors: {primary: '#137fec'}
                    }
                }
            }
        </script>
        <style>
            /* FullCalendar Custom Style untuk Dark Mode */
            :root {
                --fc-border-color: #e2e8f0;
                --fc-page-bg-color: #ffffff;
                --fc-neutral-bg-color: #f8fafc;
                --fc-list-event-hover-bg-color: #f1f5f9;
                --fc-today-bg-color: #eff6ff;
            }
            .dark {
                --fc-border-color: #334155;
                --fc-page-bg-color: #0f172a;
                --fc-neutral-bg-color: #1e293b;
                --fc-list-event-hover-bg-color: #334155;
                --fc-today-bg-color: #1e3a8a;
            }
        </style>
    </head>

    <body class="bg-slate-50 dark:bg-slate-900 text-slate-900 dark:text-slate-100 min-h-screen">
        <nav class="sticky top-0 z-40 bg-white/80 dark:bg-slate-900/80 backdrop-blur-md border-b border-slate-200 dark:border-slate-800">
            <div class="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
                <div class="flex items-center gap-2">
                    <span class="material-icons-round text-primary">admin_panel_settings</span>
                    <span class="text-xl font-extrabold tracking-tight">Global Calendar (Admin)</span>
                </div>
                <div class="flex items-center gap-4">
                    <a href="AdminServlet" class="text-sm font-bold text-slate-500 hover:text-primary flex items-center gap-1">
                        <span class="material-icons-round text-[18px]">arrow_back</span> Kembali ke Dashboard
                    </a>
                </div>
            </div>
        </nav>
        <!-- ... Lanjutkan bagian Main dan Script sama persis dengan calendar.jsp ... -->
        <main class="max-w-7xl mx-auto px-4 py-8">
            <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-slate-200 dark:border-slate-700 p-4 sm:p-6">
                <!-- Container Kalender -->
                <div id='calendar'></div>
            </div>
        </main>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'dayGridMonth',
                    locale: 'id', // Bahasa Indonesia
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,listMonth' // Opsi tampilan Bulan & List
                    },
                    buttonText: {
                        today: 'Hari ini',
                        month: 'Bulan',
                        list: 'Agenda'
                    },
                    events: 'CalendarServlet', // Ambil data dari Servlet JSON
                    eventColor: '#137fec',
                    eventBorderColor: '#0ea5e9',
                    height: 'auto',
                    eventTimeFormat: {// Kita ganti format waktu (karena ga ada jam)
                        hour: 'numeric',
                        minute: '2-digit',
                        meridiem: 'short'
                    },
                    dayMaxEvents: true, // Klik "more" kalau event terlalu banyak
                    selectable: true,
                    dateClick: function (info) {
                        // Opsional: Klik tanggal bisa membuka tambah tugas
                        // alert('Tanggal diklik: ' + info.dateStr);
                        window.location.href = "TodoServlet"; // Redirect ke halaman list untuk menambah
                    }
                });
                calendar.render();
            });
        </script>
    </body>
</html>