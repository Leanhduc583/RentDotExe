package DAO;

import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBContext {

    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "select * from account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User s = new User(rs.getInt("accountID"), rs.getString("accountUsername"), rs.getString("accountPassword"), rs.getString("accountFullname"), rs.getString("accountEmail"), rs.getString("accountPhone"), rs.getString("accountAddress"), rs.getInt("accountType"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addUser(String fullname, String username, String password) {
        String query = "insert into account(accountUsername, accountPassword, accountFullname)\n" + "values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, fullname);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateUser(String username, String password, String fullname, String email, String phone, String address) {
        String query = "update account set accountPassword = ?, accountFullname = ?, accountEmail = ?, accountPhone = ?, accountAddress = ? where accountUsername like ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, password);
            st.setString(2, fullname);
            st.setString(3, email);
            st.setString(4, phone);
            st.setString(5, address);
            st.setString(6, username);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteUser(String username, String userID) {
        String query = "delete from account where accountUsername like ?";
        String query2 = "delete from orders where accountID = ?";
        try {
            PreparedStatement st2 = connection.prepareStatement(query2);
            st2.setString(1, userID);
            st2.executeUpdate();
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, username);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        UserDAO user = new UserDAO();
        List<User> users = user.getAll();
        System.out.println(users.get(4).getEmail());
    }
}
