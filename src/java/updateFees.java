import Dao.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class updateFees extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       PrintWriter pw= response.getWriter();
       pw.println("Update Fees servlet");
    }
}
