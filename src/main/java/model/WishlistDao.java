package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class WishlistDao {

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

    // Add to Wishlist
    public boolean addToWishlist(int userId, int watchId) {
        String query = "INSERT IGNORE INTO wishlist (user_id, watch_id) VALUES (?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, watchId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Remove from Wishlist
    public boolean removeFromWishlist(int userId, int watchId) {
        String query = "DELETE FROM wishlist WHERE user_id = ? AND watch_id = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, watchId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Wishlist Items for a User
    public List<Watch> getWishlistItems(int userId) {
        List<Watch> list = new ArrayList<>();
        String query = "SELECT w.id, w.name, w.price, w.brand, w.image " +
                       "FROM wishlist wl JOIN watches w ON wl.watch_id = w.id " +
                       "WHERE wl.user_id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Watch w = new Watch();
                w.setId(rs.getInt("id"));
                w.setName(rs.getString("name"));
                w.setPrice(rs.getBigDecimal("price"));
                w.setBrand(rs.getString("brand"));
                w.setImage(rs.getString("image"));
                list.add(w);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
 // ✅ Remove from Wishlist and return success/failure
    public boolean removeFromWishlist1(int userId, int watchId) {
        String query = "DELETE FROM wishlist WHERE user_id=? AND watch_id=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, watchId);

            return ps.executeUpdate() > 0;  // true if a row was deleted
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
