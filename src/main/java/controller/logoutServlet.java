package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

public class logoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Ambil session yang ada
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // 2. Hapus semua data di session (Termasuk data login user)
            session.invalidate();
        }
        
        // 3. Lempar kembali ke halaman login
        response.sendRedirect("login_form.jsp");
    }
}