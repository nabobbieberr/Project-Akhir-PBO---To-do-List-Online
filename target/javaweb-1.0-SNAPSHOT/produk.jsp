<%@page import="java.util.List"%>
<%@page import="model.produk"%>
<%@page import="model.User"%>
<%
    User userAktif = (User) session.getAttribute("userAktif");
    if (userAktif == null) {
        response.sendRedirect("login_form.jsp");
        return;
    }
    List<produk> daftarTask = (List<produk>) request.getAttribute("daftarTask");
    if (daftarTask == null) {
        daftarTask = new java.util.ArrayList<>();
    }

    // Ambil Stats dari Servlet
    Integer total = (Integer) request.getAttribute("totalTasks");
    Integer completed = (Integer) request.getAttribute("completedTasks");
    Integer today = (Integer) request.getAttribute("todayTasks");
    String activeFilter = (String) request.getAttribute("activeFilter");
    if (activeFilter == null)
        activeFilter = "aktif";
%>

<!DOCTYPE html>
<html lang="id" class="light">
    <head>
        <meta charset="UTF-8">
        <title>Workspace | To-Do List Online</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
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
            .custom-scrollbar::-webkit-scrollbar {
                width: 6px;
            }
            .custom-scrollbar::-webkit-scrollbar-track {
                background: transparent;
            }
            .custom-scrollbar::-webkit-scrollbar-thumb {
                background: #cbd5e1;
                border-radius: 10px;
            }
            .dark .custom-scrollbar::-webkit-scrollbar-thumb {
                background: #475569;
            }
        </style>
    </head>

    <body class="bg-[#f8fafc] dark:bg-[#0f172a] text-slate-900 dark:text-slate-100 min-h-screen transition-colors duration-300">

        <nav class="sticky top-0 z-40 bg-white/80 dark:bg-slate-900/80 backdrop-blur-md border-b border-slate-200 dark:border-slate-800">
            <div class="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
                <div class="flex items-center gap-2">
                    <img src="images/logo2.png" alt="Logo" class="h-10 w-auto"/>
                    <span class="text-xl font-extrabold tracking-tight bg-clip-text text-transparent bg-gradient-to-r from-primary to-blue-400">
                        To-Do List Online
                    </span>
                </div>
                <div class="flex items-center gap-4">
                    <span class="text-sm font-medium hidden sm:block text-slate-500">Hello, <span class="text-slate-900 dark:text-white"><%= userAktif.getNamaLengkap()%></span></span>
                    <div class="h-8 w-[1px] bg-slate-200 dark:bg-slate-700 mx-2"></div>
                    <a href="index.jsp" class="text-sm font-bold text-slate-500 hover:text-primary">Home</a>
                    <a href="logout.jsp" class="text-sm font-bold text-red-500 hover:text-red-600">Logout</a>
                </div>
            </div>
        </nav>

        <main class="max-w-7xl mx-auto px-6 py-10">

            <!-- HEADER & DASHBOARD CARDS -->
            <div class="flex flex-col gap-6 mb-10">
                <!-- Top Actions -->
                <div class="flex flex-col md:flex-row md:items-end justify-between gap-4">
                    <div>
                        <h1 class="text-3xl font-extrabold mb-2">Workspace Anda</h1>
                        <p class="text-slate-500 dark:text-slate-400">Ringkasan aktivitas dan tugas hari ini.</p>
                    </div>

                    <div class="flex flex-col sm:flex-row gap-3 w-full md:w-auto">
                        <a href="calendar.jsp" class="flex items-center justify-center gap-2 px-4 py-3 bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-xl font-bold hover:bg-slate-50 dark:hover:bg-slate-700 transition-all text-slate-700 dark:text-slate-200 shadow-sm">
                            <span class="material-icons-round">calendar_today</span>
                            Kalender
                        </a>
                        <form action="TodoServlet" method="GET" class="flex-1 flex gap-2">
                            <input type="text" name="q" placeholder="Cari tugas..." 
                                   value="<%= (request.getAttribute("searchKeyword") != null) ? request.getAttribute("searchKeyword") : ""%>"
                                   class="flex-1 px-4 py-3 bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-xl focus:ring-2 focus:ring-primary focus:outline-none transition-all">
                            <button type="submit" class="px-4 py-3 bg-slate-100 dark:bg-slate-700 rounded-xl hover:bg-slate-200 transition-all text-slate-600 dark:text-slate-300">
                                <span class="material-icons-round">search</span>
                            </button>
                        </form>
                        <button onclick="openAddModal()" class="bg-primary hover:bg-blue-600 text-white px-6 py-3 rounded-xl font-bold flex items-center justify-center gap-2 shadow-xl shadow-primary/20 transition hover:-translate-y-1 active:scale-95 whitespace-nowrap">
                            <span class="material-icons-round">add</span> Tambah
                        </button>
                    </div>
                </div>

                <!-- 3 DASHBOARD CARDS -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <!-- Card Total -->
                    <div class="bg-white dark:bg-slate-800 rounded-2xl p-6 shadow-sm border border-slate-200 dark:border-slate-700 flex items-center gap-4">
                        <div class="size-14 rounded-full bg-blue-100 dark:bg-blue-500/10 flex items-center justify-center text-blue-600 dark:text-blue-400">
                            <span class="material-icons-round text-[28px]">assignment</span>
                        </div>
                        <div>
                            <p class="text-slate-500 text-xs font-bold uppercase tracking-wider">Total Tugas</p>
                            <h3 class="text-2xl font-extrabold mt-1"><%= (total != null) ? total : 0%></h3>
                        </div>
                    </div>

                    <!-- Card Hari Ini -->
                    <div class="bg-white dark:bg-slate-800 rounded-2xl p-6 shadow-sm border border-slate-200 dark:border-slate-700 flex items-center gap-4">
                        <div class="size-14 rounded-full bg-amber-100 dark:bg-amber-500/10 flex items-center justify-center text-amber-600 dark:text-amber-400">
                            <span class="material-icons-round text-[28px]">today</span>
                        </div>
                        <div>
                            <p class="text-slate-500 text-xs font-bold uppercase tracking-wider">Deadline Hari Ini</p>
                            <h3 class="text-2xl font-extrabold mt-1"><%= (today != null) ? today : 0%></h3>
                        </div>
                    </div>

                    <!-- Card Selesai -->
                    <div class="bg-white dark:bg-slate-800 rounded-2xl p-6 shadow-sm border border-slate-200 dark:border-slate-700 flex items-center gap-4">
                        <div class="size-14 rounded-full bg-emerald-100 dark:bg-emerald-500/10 flex items-center justify-center text-emerald-600 dark:text-emerald-400">
                            <span class="material-icons-round text-[28px]">check_circle</span>
                        </div>
                        <div>
                            <p class="text-slate-500 text-xs font-bold uppercase tracking-wider">Sudah Selesai</p>
                            <h3 class="text-2xl font-extrabold mt-1"><%= (completed != null) ? completed : 0%></h3>
                        </div>
                    </div>
                </div>
            </div>

            <!-- FILTER TABS & TABLE -->
            <div class="bg-white dark:bg-slate-800 rounded-3xl shadow-sm border border-slate-200 dark:border-slate-700 overflow-hidden">

                <!-- Tabs Filter -->
                <div class="px-6 py-4 border-b border-slate-100 dark:border-slate-700 flex gap-4">
                    <a href="TodoServlet?filter=aktif" 
                       class="text-sm font-bold pb-1 border-b-2 <%= "aktif".equals(activeFilter) ? "border-primary text-primary" : "border-transparent text-slate-500 hover:text-slate-800"%> transition-all">
                        Tugas Aktif
                    </a>
                    <a href="TodoServlet?filter=riwayat" 
                       class="text-sm font-bold pb-1 border-b-2 <%= "riwayat".equals(activeFilter) ? "border-primary text-primary" : "border-transparent text-slate-500 hover:text-slate-800"%> transition-all">
                        Riwayat Selesai
                    </a>
                </div>

                <div class="overflow-x-auto custom-scrollbar">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-slate-50 dark:bg-slate-700/50 border-b border-slate-200 dark:border-slate-700">
                                <!-- KOLOM DONE SUDAH DIHAPUS -->
                                <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500">No</th>
                                <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500">Informasi Tugas</th>
                                <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500">Status</th>
                                <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500 text-center">Deadline</th>
                                <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500 text-right">Aksi</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100 dark:divide-slate-700/50">
                            <%
                                int no = 1;
                                for (produk t : daftarTask) {
                                    String deadline = (t.getDeadline() != null) ? t.getDeadline().toString() : "-";
                                    String statusClass = "bg-slate-100 text-slate-600";
                                    if (t.getStatus().equalsIgnoreCase("Selesai"))
                                        statusClass = "bg-emerald-100 text-emerald-600 dark:bg-emerald-500/10 dark:text-emerald-400";
                                    else if (t.getStatus().equalsIgnoreCase("Berjalan"))
                                        statusClass = "bg-blue-100 text-blue-600 dark:bg-blue-500/10 dark:text-blue-400";
                                    else
                                        statusClass = "bg-amber-100 text-amber-600 dark:bg-amber-500/10 dark:text-amber-400";
                            %>
                            <tr class="group hover:bg-slate-50 dark:hover:bg-slate-700/30 transition-colors">
                                <!-- KOLOM NO -->
                                <td class="px-6 py-4 text-sm font-medium text-slate-400"><%= no++%></td>

                                <td class="px-6 py-4">
                                    <!-- JUDUL DAN DESKRIPSI (Tanpa strikethrough otomatis) -->
                                    <div class="font-bold text-slate-900 dark:text-white mb-0.5"><%= t.getJudul()%></div>
                                    <div class="text-sm text-slate-500 line-clamp-1"><%= t.getDeskripsi()%></div>
                                </td>

                                <td class="px-6 py-4">
                                    <span class="px-3 py-1 rounded-full text-[11px] font-bold uppercase tracking-tight <%= statusClass%>"><%= t.getStatus()%></span>
                                </td>
                                <td class="px-6 py-4 text-center">
                                    <span class="text-sm font-semibold text-slate-700 dark:text-slate-300"><%= deadline%></span>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center justify-end gap-2">
                                        <button onclick="openEditModal(this)" 
                                                data-id="<%= t.getId()%>" data-judul="<%= t.getJudul()%>" 
                                                data-deskripsi="<%= t.getDeskripsi()%>" data-status="<%= t.getStatus()%>" 
                                                data-deadline="<%= deadline%>"
                                                class="p-2 text-slate-400 hover:text-amber-500 hover:bg-amber-50 dark:hover:bg-amber-500/10 rounded-lg transition-all">
                                            <span class="material-icons-round text-xl">edit_note</span>
                                        </button>
                                        <form action="<%= request.getContextPath()%>/TodoServlet" method="post" onsubmit="return confirm('Hapus tugas ini?')" class="inline">
                                            <input type="hidden" name="id" value="<%= t.getId()%>">
                                            <input type="hidden" name="proses" value="Hapus">
                                            <button type="submit" class="p-2 text-slate-400 hover:text-red-500 hover:bg-red-50 dark:hover:bg-red-500/10 rounded-lg transition-all">
                                                <span class="material-icons-round text-xl">delete_outline</span>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <% } %>

                            <% if (daftarTask.isEmpty()) {%>
                            <tr>
                                <!-- Colspan disesuaikan jadi 5 karena kolom Done dihapus -->
                                <td colspan="5" class="py-20 text-center">
                                    <div class="flex flex-col items-center opacity-40">
                                        <span class="material-icons-round text-6xl mb-2">
                                            <%= "riwayat".equals(activeFilter) ? "history" : "assignment_late"%>
                                        </span>
                                        <p class="text-lg font-medium">
                                            <%= "riwayat".equals(activeFilter) ? "Belum ada riwayat tugas" : "Belum ada tugas aktif"%>
                                        </p>
                                    </div>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>

        <!-- Modal Form -->
        <div id="taskModal" class="fixed inset-0 z-50 bg-slate-900/60 backdrop-blur-sm hidden items-center justify-center p-4">
            <div class="bg-white dark:bg-slate-800 w-full max-w-md rounded-3xl shadow-2xl overflow-hidden transform transition-all scale-95 opacity-0 duration-300" id="modalPanel">
                <div class="px-8 py-6 border-b border-slate-100 dark:border-slate-700 flex justify-between items-center">
                    <h2 id="modalTitle" class="text-xl font-extrabold">Tambah Tugas</h2>
                    <button onclick="closeModal()" class="text-slate-400 hover:text-slate-600 transition-colors">
                        <span class="material-icons-round">close</span>
                    </button>
                </div>
                <form id="taskForm" action="<%= request.getContextPath()%>/TodoServlet" method="post" class="p-8 space-y-5">
                    <input type="hidden" name="id" id="taskId">
                    <input type="hidden" name="proses" id="proses">
                    <div class="space-y-1.5">
                        <label class="text-xs font-bold text-slate-500 uppercase ml-1">Judul Tugas</label>
                        <input type="text" name="judul" id="judul" placeholder="Apa yang ingin dikerjakan?" 
                               class="w-full px-4 py-3 bg-slate-50 dark:bg-slate-900/50 border border-slate-200 dark:border-slate-700 rounded-xl focus:ring-2 focus:ring-primary focus:outline-none transition-all" required>
                    </div>
                    <div class="space-y-1.5">
                        <label class="text-xs font-bold text-slate-500 uppercase ml-1">Deskripsi</label>
                        <textarea name="deskripsi" id="deskripsi" rows="3" placeholder="Tambahkan detail tugas..." 
                                  class="w-full px-4 py-3 bg-slate-50 dark:bg-slate-900/50 border border-slate-200 dark:border-slate-700 rounded-xl focus:ring-2 focus:ring-primary focus:outline-none transition-all" required></textarea>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="space-y-1.5">
                            <label class="text-xs font-bold text-slate-500 uppercase ml-1">Status</label>
                            <select name="status" id="status" class="w-full px-4 py-3 bg-slate-50 dark:bg-slate-900/50 border border-slate-200 dark:border-slate-700 rounded-xl focus:ring-2 focus:ring-primary focus:outline-none transition-all appearance-none">
                                <option value="Belum Selesai">Belum Selesai</option>
                                <option value="Berjalan">Berjalan</option>
                                <option value="Selesai">Selesai</option>
                            </select>
                        </div>
                        <div class="space-y-1.5">
                            <label class="text-xs font-bold text-slate-500 uppercase ml-1">Deadline</label>
                            <input type="date" name="deadline" id="deadline" 
                                   class="w-full px-4 py-3 bg-slate-50 dark:bg-slate-900/50 border border-slate-200 dark:border-slate-700 rounded-xl focus:ring-2 focus:ring-primary focus:outline-none transition-all" required>
                        </div>
                    </div>
                    <div class="pt-4 flex gap-3">
                        <button type="button" onclick="closeModal()" class="flex-1 py-3 font-bold text-slate-500 hover:bg-slate-100 dark:hover:bg-slate-700 rounded-xl transition-all">Batal</button>
                        <button type="submit" id="submitBtn" class="flex-1 py-3 bg-primary text-white font-bold rounded-xl shadow-lg shadow-primary/30 hover:bg-blue-600 transition-all">Simpan</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            const modal = document.getElementById("taskModal");
            const panel = document.getElementById("modalPanel");

            // Fungsi ToggleComplete (AJAX) DIHAPUS

            function showModal() {
                modal.classList.remove("hidden");
                modal.classList.add("flex");
                setTimeout(() => {
                    panel.classList.remove("scale-95", "opacity-0");
                    panel.classList.add("scale-100", "opacity-100");
                }, 10);
            }

            function closeModal() {
                panel.classList.add("scale-95", "opacity-0");
                panel.classList.remove("scale-100", "opacity-100");
                setTimeout(() => {
                    modal.classList.add("hidden");
                    modal.classList.remove("flex");
                }, 300);
            }

            function openAddModal() {
                document.getElementById("taskForm").reset();
                document.getElementById("proses").value = "Simpan";
                document.getElementById("modalTitle").innerText = "Buat Tugas Baru";
                document.getElementById("submitBtn").innerText = "Simpan Tugas";
                showModal();
            }

            function openEditModal(btn) {
                const d = btn.dataset;
                document.getElementById("taskId").value = d.id;
                document.getElementById("judul").value = d.judul;
                document.getElementById("deskripsi").value = d.deskripsi;
                document.getElementById("status").value = d.status;
                if (d.deadline !== "-")
                    document.getElementById("deadline").value = d.deadline;

                document.getElementById("proses").value = "Ubah";
                document.getElementById("modalTitle").innerText = "Perbarui Tugas";
                document.getElementById("submitBtn").innerText = "Update";
                showModal();
            }
        </script>
    </body>
</html>