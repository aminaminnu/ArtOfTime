package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerDao {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/watchstore", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static int saveCustomer(Customer c) {
        int status = 0;
        try (Connection con = getConnection()) {
            con.setAutoCommit(false);

            PreparedStatement ps = con.prepareStatement("INSERT INTO user(fname, lname, phone, utype) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, c.getFname());
            ps.setString(2, c.getLname());
            ps.setLong(3, c.getPhone());
            ps.setString(4, c.getUtype());
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt(1);
            }

            PreparedStatement ps2 = con.prepareStatement("INSERT INTO login(email, password, userid) VALUES (?, ?, ?)");
            ps2.setString(1, c.getEmail());
            ps2.setString(2, c.getPassword());
            ps2.setInt(3, userId);
            ps2.executeUpdate();

            if ("user".equals(c.getUtype())) {
                PreparedStatement ps3 = con.prepareStatement("INSERT INTO customer(ctype, userid) VALUES (?, ?)");
                ps3.setString(1, c.getCtype());
                ps3.setInt(2, userId);
                status = ps3.executeUpdate();
            }

            con.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
    public static Customer getCustomerById(int id) {
        Customer c = null;
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT user.id, user.fname, user.lname, user.phone, user.utype, login.email, login.password, customer.ctype " +
                "FROM user " +
                "JOIN login ON user.id = login.userid " +
                "LEFT JOIN customer ON user.id = customer.userid " +
                "WHERE user.id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                c = new Customer();
                c.setId(rs.getInt(1));
                c.setFname(rs.getString(2));
                c.setLname(rs.getString(3));
                c.setPhone(rs.getLong(4));
                c.setUtype(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setPassword(rs.getString(7));
                c.setCtype(rs.getString(8));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }


    public static Customer checkLogin(String email, String password) {
        Customer c = null;

        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT user.id, user.fname, user.lname, user.phone, user.utype, login.email, login.password, customer.ctype " +
                "FROM user " +
                "JOIN login ON user.id = login.userid " +
                "LEFT JOIN customer ON user.id = customer.userid " +
                "WHERE login.email = ? AND login.password = ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                c = new Customer();
                c.setId(rs.getInt(1));
                c.setFname(rs.getString(2));
                c.setLname(rs.getString(3));
                c.setPhone(rs.getLong(4));
                c.setUtype(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setPassword(rs.getString(7));
                c.setCtype(rs.getString(8));

                // Debugging: Print fetched values
                System.out.println("ID: " + c.getId());
                System.out.println("Email: " + c.getEmail());
                System.out.println("User Type: " + c.getUtype());
                System.out.println("Customer Type (ctype): " + c.getCtype()); // Check if null
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }


    public static List<Customer> getAllCustomers(String utype, int userId) {
        List<Customer> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            PreparedStatement ps;

            if ("admin".equals(utype)) {
                // Admin can see all users
                ps = con.prepareStatement(
                    "SELECT user.id, user.fname, user.lname, user.phone, user.utype, login.email, login.password, customer.ctype " +
                    "FROM user " +
                    "JOIN login ON user.id = login.userid " +
                    "LEFT JOIN customer ON user.id = customer.userid");
            } else {
                // User can see only their own data
                ps = con.prepareStatement(
                    "SELECT user.id, user.fname, user.lname, user.phone, user.utype, login.email, login.password, customer.ctype " +
                    "FROM user " +
                    "JOIN login ON user.id = login.userid " +
                    "LEFT JOIN customer ON user.id = customer.userid " +
                    "WHERE user.id = ?");
                ps.setInt(1, userId);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt(1));
                c.setFname(rs.getString(2));
                c.setLname(rs.getString(3));
                c.setPhone(rs.getLong(4));
                c.setUtype(rs.getString(5));
                c.setEmail(rs.getString(6));
                c.setPassword(rs.getString(7));
                c.setCtype(rs.getString(8));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int updateCustomer(Customer c) {
        int status = 0;
        try (Connection con = getConnection()) {
            con.setAutoCommit(false);

            // Update user table
            PreparedStatement ps = con.prepareStatement(
                "UPDATE user SET fname=?, lname=?, phone=?, utype=? WHERE id=?");
            ps.setString(1, c.getFname());
            ps.setString(2, c.getLname());
            ps.setLong(3, c.getPhone());
            ps.setString(4, c.getUtype());
            ps.setInt(5, c.getId());
            ps.executeUpdate();

            // Update login table
            PreparedStatement ps2 = con.prepareStatement(
                "UPDATE login SET email=?, password=? WHERE userid=?");
            ps2.setString(1, c.getEmail());
            ps2.setString(2, c.getPassword());
            ps2.setInt(3, c.getId());
            ps2.executeUpdate();

            // Update customer table if user type is "user"
            if ("user".equals(c.getUtype())) {
                PreparedStatement ps3 = con.prepareStatement(
                    "UPDATE customer SET ctype=? WHERE userid=?");
                ps3.setString(1, c.getCtype());
                ps3.setInt(2, c.getId());
                status = ps3.executeUpdate();
            }

            con.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }



    public static int deleteCustomer(int id) {
        int status = 0;
        try (Connection con = getConnection()) {
            PreparedStatement ps1 = con.prepareStatement("DELETE FROM customer WHERE userid=?");
            ps1.setInt(1, id);
            ps1.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement("DELETE FROM login WHERE userid=?");
            ps2.setInt(1, id);
            status = ps2.executeUpdate();

            PreparedStatement ps3 = con.prepareStatement("DELETE FROM user WHERE id=?");
            ps3.setInt(1, id);
            status = ps3.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // Add a watch to the database

}
