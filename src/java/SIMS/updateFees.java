import Dao.*;
import Model.Student;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

public class updateFees extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       PrintWriter pw= response.getWriter();
       
       try {            
            String email= request.getParameter("mail");
            Integer CurrentFee=Integer.valueOf(request.getParameter("fee"));
            Integer AmountFee=Integer.valueOf(request.getParameter("amount"));
            System.out.println(email);
            System.out.println(AmountFee);
            System.out.println(CurrentFee);            
            
            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");
          
            int FEES = dao.updateFees(CurrentFee,AmountFee,email);
            System.out.println(FEES);
            if (FEES!=0) {
                System.out.println("SUCCESS");
                request.setAttribute("StudentFees", FEES);
                RequestDispatcher rd = request.getRequestDispatcher("addFees.jsp");
                rd.forward(request, response);

            } else {
                request.setAttribute("status", "FAILED");
                RequestDispatcher rd = request.getRequestDispatcher("addFees.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}