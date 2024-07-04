package DAO;

import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContext {

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("productType"), rs.getFloat("productPrice"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getHotel() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where productType = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("productType"), rs.getFloat("productPrice"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getHomeStay() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where productType = 2";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("productType"), rs.getFloat("productPrice"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getVilla() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where productType = 3";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("productType"), rs.getFloat("productPrice"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getNew() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product order by productID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("productType"), rs.getFloat("productPrice"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID(String id) {
        Product p = new Product();
        String sql = "select * from product where productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                p = new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("productType"), rs.getFloat("productPrice"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return p;
    }

    public static void main(String[] args) {
        ProductDAO pro = new ProductDAO();
        List<Product> products = new ArrayList<>();
        products = pro.getVilla();
        System.out.println(products.get(4).getName());
    }
}
