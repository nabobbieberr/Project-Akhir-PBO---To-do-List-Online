package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            try (Connection conn = util.KoneksiDB.getConnection()) {

                // Cek email
                String checkSql = "SELECT * FROM users WHERE email=?";
                PreparedStatement checkStmt = conn.prepareStatement(checkSql);
                checkStmt.setString(1, email);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    response.sendRedirect("register.jsp?error=exists");
                } else {
                    // Insert data baru (Perbaiki nama kolom jadi 'nama_lengkap')
                    String insertSql = "INSERT INTO users (nama_lengkap, email, password) VALUES (?, ?, ?)";
                    PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                    insertStmt.setString(1, name);
                    insertStmt.setString(2, email);
                    insertStmt.setString(3, password);
                    insertStmt.executeUpdate();

                    response.sendRedirect("login_form.jsp?register=success");
                }
                rs.close();
                checkStmt.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=1");
        }
    }
}
