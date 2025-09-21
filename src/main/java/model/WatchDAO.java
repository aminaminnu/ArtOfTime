package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WatchDAO {

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

    // ✅ Fetch All Watches with Quantity
    public List<Watch> getAllWatches() {
        List<Watch> watches = new ArrayList<>();
        String query = "SELECT id, name, price, brand, image, quantity FROM watches"; // Added quantity field

        try (Connection con = getConnection();
             PreparedStatement stmt = con.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                watches.add(new Watch(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getBigDecimal("price"),
                    rs.getString("brand"),
                    rs.getString("image"),
                    rs.getInt("quantity") // Retrieve quantity
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return watches;
    }

    // ✅ Fetch a single watch by ID with Quantity
    public Watch getWatchById(int id) {
        String query = "SELECT id, name, price, brand, image, quantity FROM watches WHERE id = ?";

        try (Connection con = getConnection();
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Watch(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getBigDecimal("price"),
                        rs.getString("brand"),
                        rs.getString("image"),
                        rs.getInt("quantity")
                    );
                } else {
                    throw new RuntimeException("Watch with ID " + id + " not found.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
