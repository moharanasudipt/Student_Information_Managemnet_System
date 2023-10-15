
import Model.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class logout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        session.invalidate();
        response.sendRedirect("Login.html");
    }
}
