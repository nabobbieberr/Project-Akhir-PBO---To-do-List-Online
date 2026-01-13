package controller;

import dao.produkDAO;
import model.produk;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/CalendarServlet")
public class CalendarServlet extends HttpServlet {

    private produkDAO produkDao = new produkDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userAktif") == null) {
            response.sendError(401); // Unauthorized
            return;
        }

        User userAktif = (User) session.getAttribute("userAktif");
        String role = (String) session.getAttribute("role");

        List<produk> list = null;

        // Jika Admin, ambil semua tugas. Jika User biasa, ambil milik sendiri
        if ("admin".equals(role)) {
            list = produkDao.getAllTasksAdmin();
        } else {
            list = produkDao.getAllTask(userAktif.getId());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        // Konversi Java List ke JSON String Manual
        StringBuilder jsonBuilder = new StringBuilder("[");

        for (int i = 0; i < list.size(); i++) {
            produk t = list.get(i);

            // Format tanggal: YYYY-MM-DD
            String tanggal = "2023-01-01";
            if (t.getDeadline() != null) {
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                tanggal = sdf.format(t.getDeadline());
            }

            jsonBuilder.append("{");
            jsonBuilder.append("\"title\":\"").append(escapeJson(t.getJudul())).append("\",");
            jsonBuilder.append("\"start\":\"").append(tanggal).append("\",");
            jsonBuilder.append("\"url\":\"TodoServlet\""); // Klik tanggal bisa redirect ke list
            jsonBuilder.append("}");

            if (i < list.size() - 1) {
                jsonBuilder.append(",");
            }
        }
        jsonBuilder.append("]");

        out.print(jsonBuilder.toString());
        out.flush();
    }

    // Helper untuk escape karakter khusus di JSON
    private String escapeJson(String s) {
        if (s == null) {
            return "";
        }
        return s.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}
