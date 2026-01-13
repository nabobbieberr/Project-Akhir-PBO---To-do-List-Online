<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%
    // Security Check di JSP
    User userAktif = (User) session.getAttribute("userAktif");
    if (userAktif == null || !"admin".equals(userAktif.getRole())) {
        response.sendRedirect("login_form.jsp");
        return;
    }

    // Ambil data dari Servlet
    Integer totalUsers = (Integer) request.getAttribute("totalUsers");
    Integer totalTasks = (Integer) request.getAttribute("totalTasks");
    List<User> listUser = (List<User>) request.getAttribute("listUser");

    if (totalUsers == null) {
        totalUsers = 0;
    }
    if (totalTasks == null) {
        totalTasks = 0;
    }
%>

<!DOCTYPE html>
<html lang="id" class="light">
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard | To-Do List</title>
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
                        colors: {primary: '#137fec', danger: '#ef4444'}
                    }
                }
            }
        </script>
    </head>

    <body class="bg-[#f8fafc] dark:bg-[#0f172a] text-slate-900 dark:text-slate-100 min-h-screen transition-colors duration-300">

        <!-- Navbar Sama Dengan Produk -->
        <nav class="sticky top-0 z-40 bg-white/80 dark:bg-slate-900/80 backdrop-blur-md border-b border-slate-200 dark:border-slate-800">
            <div class="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
                <div class="flex items-center gap-2">
                    <img src="images/logo2.png" alt="Logo" class="h-10 w-auto"/>
                    <span class="text-xl font-extrabold tracking-tight bg-clip-text text-transparent bg-gradient-to-r from-primary to-blue-400">
                        Admin Dashboard
                    </span>
                </div>
                <div class="flex items-center gap-4">
                    <span class="text-sm font-medium text-slate-500">
                        Administrator: <span class="text-slate-900 dark:text-white"><%= userAktif.getNamaLengkap()%></span>
                    </span>
                    <div class="h-8 w-[1px] bg-slate-200 dark:bg-slate-700 mx-2"></div>
                    <a href="produk.jsp" class="text-sm font-bold text-slate-500 hover:text-primary">Lihat Tasks</a>
                    <a href="logout.jsp" class="text-sm font-bold text-red-500 hover:text-red-600">Logout</a>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="max-w-7xl mx-auto px-6 py-10">

            <!-- HEADER UTAMA (Judul + Search + Calendar) -->
            <div class="flex flex-col md:flex-row md:items-end justify-between gap-6 mb-10">
                <div>
                    <h1 class="text-3xl font-extrabold mb-2">Ringkasan Sistem</h1>
                    <p class="text-slate-500 dark:text-slate-400">Pantau pengguna dan aktivitas aplikasi secara real-time.</p>
                </div>

                <div class="flex flex-col sm:flex-row gap-3 w-full md:w-auto">
                    <!-- SEARCH FORM ADMIN -->
                    <form action="AdminServlet" method="GET" class="flex-1 flex gap-2">
                        <input type="text" name="q" placeholder="Cari user (Nama/Email)..." 
                               value="<%= (request.getAttribute("searchKeyword") != null) ? request.getAttribute("searchKeyword") : ""%>"
                               class="flex-1 px-4 py-3 bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-xl focus:ring-2 focus:ring-primary focus:outline-none transition-all">
                        <button type="submit" class="px-4 py-3 bg-slate-100 dark:bg-slate-700 rounded-xl hover:bg-slate-200 transition-all text-slate-600 dark:text-slate-300">
                            <span class="material-icons-round">search</span>
                        </button>
                    </form>
                </div>
            </div>

            <!-- STATS CARDS -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mb-10">
                <!-- Card Total Users -->
                <div class="bg-white dark:bg-slate-800 rounded-2xl p-6 shadow-sm border border-slate-200 dark:border-slate-700 flex items-center gap-4">
                    <div class="size-14 rounded-full bg-primary/10 flex items-center justify-center text-primary">
                        <span class="material-icons-round text-[32px]">people</span>
                    </div>
                    <div>
                        <p class="text-slate-500 text-sm font-bold uppercase tracking-wider">Total User</p>
                        <h3 class="text-3xl font-extrabold mt-1"><%= totalUsers%></h3>
                    </div>
                </div>

                <!-- Card Total Tasks -->
                <div class="bg-white dark:bg-slate-800 rounded-2xl p-6 shadow-sm border border-slate-200 dark:border-slate-700 flex items-center gap-4">
                    <div class="size-14 rounded-full bg-purple-500/10 flex items-center justify-center text-purple-500">
                        <span class="material-icons-round text-[32px]">assignment</span>
                    </div>
                    <div>
                        <p class="text-slate-500 text-sm font-bold uppercase tracking-wider">Total Tugas</p>
                        <h3 class="text-3xl font-extrabold mt-1"><%= totalTasks%></h3>
                    </div>
                </div>

                <!-- Card Info -->
                <div class="bg-gradient-to-br from-primary to-blue-600 rounded-2xl p-6 shadow-lg text-white flex items-center justify-between">
                    <div>
                        <p class="text-blue-100 text-sm font-bold uppercase tracking-wider">Status Server</p>
                        <h3 class="text-xl font-extrabold mt-1">Online</h3>
                        <p class="text-blue-200 text-sm mt-2">Database connected</p>
                    </div>
                    <span class="material-icons-round text-5xl text-white/20">settings_suggest</span>
                </div>
            </div>

            <!-- USER LIST TABLE -->
            <div class="bg-white dark:bg-slate-800 rounded-3xl shadow-sm border border-slate-200 dark:border-slate-700 overflow-hidden">
                <div class="px-8 py-6 border-b border-slate-100 dark:border-slate-700 flex justify-between items-center">
                    <h2 class="text-lg font-bold">Manajemen Pengguna</h2>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-slate-50 dark:bg-slate-700/50 border-b border-slate-200 dark:border-slate-700">
                                <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500">ID</th>
                                <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500">Nama Lengkap</th>
                                <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500">Email</th>
                                <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500">Role</th>
                                <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-slate-500 text-right">Aksi</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100 dark:divide-slate-700/50">
                            <%
                                if (listUser != null && !listUser.isEmpty()) {
                                    for (User u : listUser) {
                            %>
                            <tr class="group hover:bg-slate-50 dark:hover:bg-slate-700/30 transition-colors">
                                <td class="px-6 py-4 text-sm font-mono text-slate-400"><%= u.getId()%></td>
                                <td class="px-6 py-4 font-bold text-slate-900 dark:text-white"><%= u.getNamaLengkap()%></td>
                                <td class="px-6 py-4 text-sm text-slate-500"><%= u.getEmail()%></td>
                                <td class="px-6 py-4">
                                    <span class="px-3 py-1 rounded-full text-[11px] font-bold uppercase tracking-tight <%= "admin".equals(u.getRole()) ? "bg-primary/10 text-primary" : "bg-slate-100 text-slate-600"%>">
                                        <%= u.getRole()%>
                                    </span>
                                </td>
                                <td class="px-6 py-4 text-right">
                                    <%
                                        // Cek apakah ini akun admin sendiri. Kalau iya, tombol hapus tidak muncul
                                        if (u.getId() != userAktif.getId()) {
                                    %>
                                    <form action="AdminServlet" method="post" onsubmit="return confirm('Yakin hapus user ini? Tugas mereka akan hilang permanen.');" class="inline">
                                        <input type="hidden" name="proses" value="HapusUser">
                                        <input type="hidden" name="userId" value="<%= u.getId()%>">
                                        <button type="submit" class="p-2 text-slate-400 hover:text-red-500 hover:bg-red-50 dark:hover:bg-red-500/10 rounded-lg transition-all" title="Hapus User">
                                            <span class="material-icons-round text-xl">delete_forever</span>
                                        </button>
                                    </form>
                                    <% } else { %>
                                    <span class="text-xs text-slate-400 italic">Anda sendiri</span>
                                    <% } %>
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="5" class="py-10 text-center text-slate-500">Belum ada user terdaftar.</td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>

        </main>
    </body>
</html>