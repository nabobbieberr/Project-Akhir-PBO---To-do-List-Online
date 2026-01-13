package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

// >>> Tambahkan baris import ini: <<<
import jakarta.servlet.annotation.WebServlet;

// >>> Tambahkan baris Annotation ini tepat di bawah: <<<
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login_form.jsp");
            return;
        }

        String keyword = request.getParameter("q"); // Ambil keyword search
        
        // Panggil DAO yang sudah ada atau yang baru searchUsers
        dao.UserDAO userDAO = new dao.UserDAO(); // Pastikan import userDAO
        
        int totalUsers = userDAO.getTotalUsers();
        int totalTasks = userDAO.getTotalTasks(); // Perhatikan: totalTasks ada di UserDAO
        
        // Mengambil list user dengan filter search atau semua
        List<User> listUser;
        if (keyword != null && !keyword.trim().isEmpty()) {
            listUser = userDAO.searchUsers(keyword);
        } else {
            listUser = userDAO.getAllUsers();
        }

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalTasks", totalTasks);
        request.setAttribute("listUser", listUser);
        request.setAttribute("searchKeyword", keyword);

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ... isi kode doPost tetap sama ...
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login_form.jsp");
            return;
        }
        String proses = request.getParameter("proses");
        if ("HapusUser".equals(proses)) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            User adminAktif = (User) session.getAttribute("userAktif");
            if (userId != adminAktif.getId()) {
                userDAO.deleteUser(userId);
            }
        }
        response.sendRedirect("AdminServlet");
    }
}
