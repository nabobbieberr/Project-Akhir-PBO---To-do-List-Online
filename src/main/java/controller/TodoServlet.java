package controller;

import dao.produkDAO;
import model.produk;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class TodoServlet extends HttpServlet {

    private final produkDAO dao = new produkDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userAktif") == null) {
            response.sendRedirect("login_form.jsp");
            return;
        }

        User userAktif = (User) session.getAttribute("userAktif");
        String keyword = request.getParameter("q");
        String filter = request.getParameter("filter"); // "all", "riwayat", "aktif"

        // 1. Ambil Data Statistik Dashboard
        Map<String, Integer> stats = dao.getDashboardStats(userAktif.getId());
        request.setAttribute("totalTasks", stats.get("total"));
        request.setAttribute("completedTasks", stats.get("selesai"));
        request.setAttribute("todayTasks", stats.get("hariIni"));

        // 2. Ambil List Tugas dengan Filter
        List<produk> list;

        if (keyword != null && !keyword.trim().isEmpty()) {
            list = dao.searchTasks(userAktif.getId(), keyword);
        } else {
            list = dao.getFilteredTasks(userAktif.getId(), filter);
        }

        request.setAttribute("daftarTask", list);
        request.setAttribute("searchKeyword", keyword);
        request.setAttribute("activeFilter", (filter == null) ? "aktif" : filter);

        request.getRequestDispatcher("produk.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String proses = request.getParameter("proses");
        User userAktif = (User) request.getSession().getAttribute("userAktif");

        // LOGIKA QUICK CHECKLIST (Toggle Status)
        if ("ToggleComplete".equals(proses)) {
            int id = Integer.parseInt(request.getParameter("id"));

            // AMBIL USER ID YANG SEDANG LOGIN (PENTING!)
            int currentUserId = userAktif.getId();

            produk t = dao.getTaskById(id);

            // LOGIKA KHUSUS: Kalau tugas lama tidak punya pemilik (user_id 0), kita paksakan jadi milik user sekarang
            if (t.getUserId() == 0 || t.getUserId() == currentUserId) {

                produk updateT = new produk();
                updateT.setId(id);

                String statusSekarang = (t.getStatus().equals("Selesai")) ? "Belum Selesai" : "Selesai";
                updateT.setStatus(statusSekarang);

                updateT.setJudul(t.getJudul());
                updateT.setDeskripsi(t.getDeskripsi());
                updateT.setDeadline(t.getDeadline());
                updateT.setUserId(currentUserId); // Set ID user sekarang!

                dao.ubah(updateT);

                response.setContentType("text/plain");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("OK");
            } else {
                // Kalau tugas itu punya user lain, tolak
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
            }
            return;
        }

        // LOGIKA CRUD NORMAL
        if ("Simpan".equals(proses)) {
            produk p = new produk();
            p.setJudul(request.getParameter("judul"));
            p.setDeskripsi(request.getParameter("deskripsi"));
            p.setStatus(request.getParameter("status"));
            p.setUserId(userAktif.getId());

            String deadline = request.getParameter("deadline");
            if (deadline != null && !deadline.trim().isEmpty()) {
                try {
                    p.setDeadline(java.sql.Date.valueOf(deadline));
                } catch (Exception e) {
                }
            }
            dao.simpan(p);

        } else if ("Ubah".equals(proses)) {
            produk p = new produk();
            p.setId(Integer.parseInt(request.getParameter("id")));
            p.setJudul(request.getParameter("judul"));
            p.setDeskripsi(request.getParameter("deskripsi"));
            p.setStatus(request.getParameter("status"));
            p.setUserId(userAktif.getId());

            String deadline = request.getParameter("deadline");
            if (deadline != null && !deadline.isEmpty()) {
                p.setDeadline(java.sql.Date.valueOf(deadline));
            }
            dao.ubah(p);

        } else if ("Hapus".equals(proses)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.hapus(id, userAktif.getId());
        }
        response.sendRedirect("TodoServlet");
    }
}
