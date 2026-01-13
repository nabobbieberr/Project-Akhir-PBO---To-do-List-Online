<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Kita tidak perlu mendeklarasikan "HttpSession session" lagi.
    // Variabel "session" sudah tersedia otomatis di JSP.
    
    if (session != null) {
        session.invalidate();
    }

    // Redirect ke halaman login
    response.sendRedirect("login_form.jsp?status=logout_success");
%>
