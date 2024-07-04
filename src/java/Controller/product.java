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
import java.util.List;

public class product extends HttpServlet {

    ProductDAO pro = new ProductDAO();
    WishlistDAO wish = new WishlistDAO();

    boolean checkExist(List<Product> products, int id) {
        for (Product p : products) {
            if (p.getId() == id) {
                return true;
            }
        }
        return false;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet product</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet product at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = pro.getNew();
        List<Wishlist> wishlist = wish.getAll();
        String id = request.getParameter("id");
        if (id == null) {
            request.setAttribute("error", "We can't find your desired item, please try again!");
        } else {
            if (checkExist(products, Integer.parseInt(id))) {
                Product p = pro.getProductByID(id);
                request.setAttribute("product", p);
            } else {
                request.setAttribute("error", "We can't find your desired item, please try again!");
            }
        }
        request.setAttribute("wishlist", wishlist);
        request.setAttribute("list", products);
        request.getRequestDispatcher("product.jsp").forward(request, response);
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
