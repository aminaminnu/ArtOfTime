package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDao {

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

    // ✅ Add to Cart (Increments quantity if item exists)
    public boolean addToCart(int userId, int watchId) {
        String query = "INSERT INTO cart (user_id, watch_id, quantity) VALUES (?, ?, 1) " +
                       "ON DUPLICATE KEY UPDATE quantity = quantity + 1";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, watchId);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error adding item to cart: " + e.getMessage(), e);
        }
    }

    // ✅ Fetch Cart Items for a User (Including Quantity)
    public List<Watch> getCartItems(int userId) {
        List<Watch> cartItems = new ArrayList<>();
        String sql = "SELECT w.id, w.name, w.price, w.brand, w.image, c.quantity " +  // Added c.quantity
                     "FROM cart c JOIN watches w ON c.watch_id = w.id " +
                     "WHERE c.user_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                cartItems.add(new Watch(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getBigDecimal("price"),
                    rs.getString("brand"),
                    rs.getString("image"),
                    rs.getInt("quantity") // Now including quantity
                ));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error fetching cart items: " + e.getMessage(), e);
        }
        return cartItems;
    }

    // ✅ Remove from Cart
    public boolean removeFromCart(int userId, int watchId) {
        String query = "DELETE FROM cart WHERE user_id = ? AND watch_id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, watchId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error removing item from cart: " + e.getMessage(), e);
        }
    }

    // ✅ Update Cart Quantity
    public boolean updateCartQuantity(int userId, int watchId, int quantity) {
        if (quantity <= 0) {
            return removeFromCart(userId, watchId);  // Remove item if quantity is 0
        }

        String query = "UPDATE cart SET quantity = ? WHERE user_id = ? AND watch_id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, quantity);
            ps.setInt(2, userId);
            ps.setInt(3, watchId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Error updating cart quantity: " + e.getMessage(), e);
        }
    }
    public void clearCart(int userId) {
        String query = "DELETE FROM cart WHERE user_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, userId);
            pstmt.executeUpdate();
            System.out.println("Cart cleared for user ID: " + userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    }


