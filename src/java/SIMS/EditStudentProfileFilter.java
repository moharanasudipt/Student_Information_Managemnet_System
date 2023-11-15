
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.annotation.WebFilter;
@WebFilter(filterName = "EditStudentProfileFilter", urlPatterns = {"/EditStudentProfile"})
public class EditStudentProfileFilter implements Filter {

    private static final boolean debug = true;
    private FilterConfig filterConfig = null;

    public EditStudentProfileFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("LoginServletFilter:DoBeforeProcessing");
        }
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("LoginServletFilter:DoAfterProcessing");
        }
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        PrintWriter pw = response.getWriter();
        HttpServletRequest hsr = (HttpServletRequest) request;

        String name = request.getParameter("uname");
        String address = request.getParameter("uaddr");
        int age = Integer.parseInt(request.getParameter("uage"));
        String contact = request.getParameter("ucontact");
        String photo = request.getParameter("uimg");

        if (isValidName(name) && isValidAddress(address) && isValidAge(age) && isValidContact(contact)) {
            chain.doFilter(request, response);
        } else {
            pw.println("<body><center><div>");
            pw.println("<h1>Invalid Format</h1>");
            if (!isValidName(name)) {
                pw.println("<h3>Give the correct Name</h3>");
            }
            if (!isValidAddress(address)) {
                pw.println("<h3>Give the correct Address</h3>");
            }
            if (!isValidAge(age)) {
                pw.println("<h3>Give the correct Age</h3>");
            }
            if (!isValidContact(contact)) {
                pw.println("<h3>The contact Number should be 10 digits</h3>");
            }            
            pw.println("</div></center></body>");
        }
    }

    private boolean isValidName(String name) {
        String namePattern = "^[a-zA-Z ]+$";
        return name != null && name.matches(namePattern);
    }

    private boolean isValidAddress(String address) {
        String addressPattern = "^[a-zA-Z0-9 ,.'-]+$";
        return address != null && address.matches(addressPattern);
    }

    private boolean isValidAge(int age) {
         return age >= 1 && age <= 100;
    }

    private boolean isValidContact(String contact) {
        String contactPattern = "^[0-9]+([-\\s]?[0-9]+)*$";
        return contact != null && contact.matches(contactPattern);
    }

    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }
}
