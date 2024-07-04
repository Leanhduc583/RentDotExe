package Controller;

import DAO.UserDAO;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class updateProfile extends HttpServlet {

    UserDAO user = new UserDAO();
    String validEmail = "[-A-Za-z0-9!#$%&'*+/=?^_`{|}~]+(?:\\.[-A-Za-z0-9!#$%&'*+/=?^_`{|}~]+)*@(?:[A-Za-z0-9](?:[-A-Za-z0-9]*[A-Za-z0-9])?\\.)+[A-Za-z0-9](?:[-A-Za-z0-9]*[A-Za-z0-9])?";
    String validNumber = "[0-9]+";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User use = (User) session.getAttribute("account");
        String username = use.getUsername();
        String email = request.getParameter("emails");
        String phone = request.getParameter("phones");
        String address = request.getParameter("addresses");
        String fullname = request.getParameter("fullnames");
        String pass = request.getParameter("passes");
        if (email.isEmpty() || phone.isEmpty() || address.isEmpty() || fullname.isEmpty() || pass.isEmpty()) {
            String error = "None of the values can be blank";
            request.setAttribute("status", error);
            request.getRequestDispatcher("profile").forward(request, response);
        } else if (phone.length() < 10) {
            String error = "Phone number must be at least 10 characters";
            request.setAttribute("status", error);
            request.getRequestDispatcher("profile").forward(request, response);
        } else if (pass.length() < 5) {
            String error = "Password must be at least 5 characters";
            request.setAttribute("status", error);
            request.getRequestDispatcher("profile").forward(request, response);
        } else if (!email.matches(validEmail)) {
            String error = "Email is not a valid email";
            request.setAttribute("status", error);
            request.getRequestDispatcher("profile").forward(request, response);
        } else {
            List<User> users = user.getAll();
            for (User u : users) {
                if (u.getUsername().equals(username)) {
                    user.updateUser(username, pass, fullname, email, phone, address);
                }
            }
            users = user.getAll();
            for (User u : users) {
                if (u.getUsername().equals(username)) {
                    session.setAttribute("account", u);
                }
            }
            request.getRequestDispatcher("profile").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
