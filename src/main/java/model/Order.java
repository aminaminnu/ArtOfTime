package model;

import java.math.BigDecimal;
import java.util.Date;

public class Order {
    private int id;
    private int userId;
    private int watchId;
    private int quantity;
    private BigDecimal totalPrice;
    private Date orderDate;
    private String watchName;
    private String imageUrl; // ✅ Added imageUrl

    public Order() {}

    public Order(int id, int userId, int watchId, int quantity, BigDecimal totalPrice, Date orderDate, String watchName, String imageUrl) {
        this.id = id;
        this.userId = userId;
        this.watchId = watchId;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.watchName = watchName;
        this.imageUrl = imageUrl; // ✅ Assign imageUrl
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getWatchId() {
        return watchId;
    }

    public void setWatchId(int watchId) {
        this.watchId = watchId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getWatchName() {
        return watchName;
    }

    public void setWatchName(String watchName) {
        this.watchName = watchName;
    }

    public String getImageUrl() { // ✅ Getter for imageUrl
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) { // ✅ Setter for imageUrl
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "Order [id=" + id + ", userId=" + userId + ", watchId=" + watchId + ", watchName=" + watchName +
               ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate +
               ", imageUrl=" + imageUrl + "]";
    }
}
