package Controller;

import DAO.WishlistDAO;
import Model.User;
import Model.Wishlist;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class editWishlist extends HttpServlet {

    WishlistDAO list = new WishlistDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editWishlist</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editWishlist at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        List<Wishlist> wishes = list.getAll();
        int productID = Integer.parseInt(request.getParameter("id"));
        int userID = u.getId();
        int change = Integer.parseInt(request.getParameter("change"));
        for (Wishlist w : wishes) {
            if (w.getUserID() == userID && w.getProductID() == productID) {
                w.setDay(w.getDay() + change);
                list.updateWishlist(userID, productID, w.getDay());
            }
        }
        wishes = list.getAll();
        request.setAttribute("wishlist", wishes);
        request.getRequestDispatcher("wishlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
