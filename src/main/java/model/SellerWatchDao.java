package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SellerWatchDao {
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
    public static Integer getSellerId(int userId) {
        Integer sellerId = null;
        String query = "SELECT id FROM customer WHERE userid = ? AND ctype = 'seller'";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    sellerId = rs.getInt("id"); // Get the seller ID from the customer table
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally, log or handle exception as needed
        }
        return sellerId;
    }


    // Add a watch
    public static int addWatch(SellerWatch watch) {
        int status = 0;

        // Get the correct seller ID from the customer table
        Integer sellerId = getSellerId(watch.getSellerid());
        if (sellerId == null) {
            System.err.println("Error: Seller ID not found for User ID " + watch.getSellerid());
            return status; // Prevent insertion if seller ID is invalid
        }

        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO watchesforsales (sellerid, watchname, brand, model, watchcondition, price) VALUES (?, ?, ?, ?, ?, ?)"
            );

            ps.setInt(1, sellerId); // Use the correct seller ID
            ps.setString(2, watch.getWatchname());
            ps.setString(3, watch.getBrand());
            ps.setString(4, watch.getModel());
            ps.setString(5, watch.getWatchcondition());
            ps.setBigDecimal(6, watch.getPrice());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }


    // Get all watches by seller ID
    public static List<SellerWatch> getWatchesBySeller(int sellerId) {
        List<SellerWatch> watchList = new ArrayList<>();
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM watchesforsales WHERE sellerid = ?");
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SellerWatch watch = new SellerWatch();
                watch.setId(rs.getInt("id"));
                watch.setSellerid(rs.getInt("sellerid"));
                watch.setWatchname(rs.getString("watchname"));
                watch.setBrand(rs.getString("brand"));
                watch.setModel(rs.getString("model"));
                watch.setWatchcondition(rs.getString("watchcondition"));
                watch.setPrice(rs.getBigDecimal("price"));

                watchList.add(watch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return watchList;
    }

    // Update watch details
    public static int updateWatch(SellerWatch watch) {
        int status = 0;
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "UPDATE watchesforsales SET watchname=?, brand=?, model=?, watchcondition=?, price=? WHERE id=? AND sellerid=?"
            );
            ps.setString(1, watch.getWatchname());
            ps.setString(2, watch.getBrand());
            ps.setString(3, watch.getModel());
            ps.setString(4, watch.getWatchcondition());
            ps.setBigDecimal(5, watch.getPrice());
            ps.setInt(6, watch.getId());
            ps.setInt(7, watch.getSellerid());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // Delete a watch
    public static int deleteWatch(int watchId, int sellerId) {
        int status = 0;
        try (Connection con = getConnection()) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM watchesforsales WHERE id=? AND sellerid=?");
            ps.setInt(1, watchId);
            ps.setInt(2, sellerId);

            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
