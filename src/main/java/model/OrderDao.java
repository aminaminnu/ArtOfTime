package model;

import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    // Reuse same DB connection method like in CartDao
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found!", e);
        }
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/watchstore", "root", "root");
    }

    // ✅ Place an order and remove from cart (all in one transaction)
    public boolean placeOrder(int userId, int watchId, int quantity) {
        String insertOrderQuery =
                "INSERT INTO orders (user_id, watch_id, quantity, total_price, order_date) VALUES (?, ?, ?, ?, NOW())";
        String deleteCartQuery =
                "DELETE FROM cart WHERE user_id = ? AND watch_id = ?";

        try (Connection con = getConnection()) {
            con.setAutoCommit(false); // Begin transaction

            // ✅ Fetch price & watch name in the same connection
            BigDecimal price = getWatchPrice(watchId, con);
            if (price == null) {
                con.rollback();
                return false;
            }

            BigDecimal totalPrice = price.multiply(BigDecimal.valueOf(quantity));

            try (PreparedStatement ps = con.prepareStatement(insertOrderQuery)) {
                ps.setInt(1, userId);
                ps.setInt(2, watchId);
                ps.setInt(3, quantity);
                ps.setBigDecimal(4, totalPrice);
                ps.executeUpdate();
            }

            try (PreparedStatement ps = con.prepareStatement(deleteCartQuery)) {
                ps.setInt(1, userId);
                ps.setInt(2, watchId);
                ps.executeUpdate();
            }

            con.commit(); // ✅ Commit transaction
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Remove order
    public boolean removeOrder(Integer userId, int orderId) {
        if (userId == null) return false;
        String query = "DELETE FROM orders WHERE id = ? AND user_id = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, orderId);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // ✅ Get user orders
    public List<Order> getUserOrders(int userId) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.id, o.quantity, o.total_price, o.order_date, w.name, w.image " +
                       "FROM orders o JOIN watches w ON o.watch_id = w.id WHERE o.user_id = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setWatchName(rs.getString("name"));
                order.setQuantity(rs.getInt("quantity"));
                order.setTotalPrice(rs.getBigDecimal("total_price"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setImageUrl(rs.getString("image"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // ✅ Helper: Get price using same connection
    private BigDecimal getWatchPrice(int watchId, Connection con) {
        String query = "SELECT price FROM watches WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, watchId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getBigDecimal("price");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
