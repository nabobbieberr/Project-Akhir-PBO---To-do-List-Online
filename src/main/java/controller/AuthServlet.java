package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import util.KoneksiDB;
import model.User;

public class AuthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection c = KoneksiDB.getConnection()) {
            // Perbaiki query sesuai nama kolom di DB
            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Simpan objek User ke session agar bisa dipanggil di JSP
                User userAktif = new User();
                userAktif.setId(rs.getInt("id"));
                userAktif.setEmail(rs.getString("email"));
                userAktif.setNamaLengkap(rs.getString("nama_lengkap"));
                userAktif.setRole(rs.getString("role"));

                HttpSession session = request.getSession();
                session.setAttribute("userAktif", userAktif);
                session.setAttribute("role", userAktif.getRole());

                if ("admin".equals(userAktif.getRole())) {
                    response.sendRedirect("AdminServlet");
                } else {
                    response.sendRedirect("TodoServlet");
                }
            } else {
                response.sendRedirect("login_form.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login_form.jsp?error=1");
        }
    }
}
