package Controller;

import DAO.ProductDAO;
import DAO.WishlistDAO;
import Model.Product;
import Model.Wishlist;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class home extends HttpServlet {

    ProductDAO pro = new ProductDAO();
    List<Product> list = new ArrayList<>();
    List<Wishlist> wish = new ArrayList<>();
    WishlistDAO wishlist = new WishlistDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet home at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        list = pro.getAll();
        request.setAttribute("products", list);
        list = pro.getHotel();
        request.setAttribute("hotels", list);
        list = pro.getHomeStay();
        request.setAttribute("homestays", list);
        list = pro.getVilla();
        request.setAttribute("villa", list);
        list = pro.getNew();
        request.setAttribute("news", list);
        wish = wishlist.getAll();
        request.setAttribute("wishlist", wish);
        request.getRequestDispatcher("home.jsp").forward(request, response);
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
