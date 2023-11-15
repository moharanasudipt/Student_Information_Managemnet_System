package SIMS;
import Dao.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class ForgetPassword extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
        try {            
            String mail = request.getParameter("email");
            String CurPwd = request.getParameter("pwd");
            String newPwd = request.getParameter("password");
            
            System.out.println("Student Email:"+mail);
            System.out.println("Current Password: "+CurPwd);
            System.out.println("New Password: "+newPwd);
            
            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");                                  
                        
            String fg= dao.resetPassword(mail, CurPwd,newPwd);
            
            System.out.println(fg);
            if (fg!=null) {
                System.out.println("Password Updated Successfully"); 
                request.setAttribute("loginRequest", "Updated Password");                               
                RequestDispatcher rd = request.getRequestDispatcher("Login.html");
                rd.forward(request, response);
            } else {
                request.setAttribute("WRONGPWD", "Password Not Updated");
                RequestDispatcher rd = request.getRequestDispatcher("Forget.html");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}