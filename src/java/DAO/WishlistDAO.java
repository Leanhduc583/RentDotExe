package DAO;

import Model.Wishlist;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WishlistDAO extends DBContext {

    public List<Wishlist> getAll() {
        List<Wishlist> list = new ArrayList<>();
        String sql = "select o.orderID, o.accountID, o.productID, p.productName, p.productPrice, o.orderDay from orders o join product p on o.productID = p.productID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Wishlist s = new Wishlist(rs.getInt("orderID"), rs.getInt("accountID"), rs.getInt("productID"), rs.getString("productName"), rs.getFloat("productPrice"), rs.getInt("orderDay"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addWishlist(String userID, String productID) {
        String query = "insert into orders values(?,?,1)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, userID);
            st.setString(2, productID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateWishlist(int userID, int productID, int day) {
        String query = "update orders set orderDay = ? where accountID = ? and productID = ?";
        String user = Integer.toString(userID);
        String product = Integer.toString(productID);
        String change = Integer.toString(day);
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, change);
            st.setString(2, user);
            st.setString(3, product);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteWishlist(int userID, int productID) {
        String query = "delete from orders where accountID = ? and productID = ?";
        String user = Integer.toString(userID);
        String product = Integer.toString(productID);
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, user);
            st.setString(2, product);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
}
