package model;

public class Cart {
    private int id;
    private int userId;
    private int watchId;
    private int quantity;

    public Cart() {}

    public Cart(int id, int userId, int watchId, int quantity) {
        this.id = id;
        this.userId = userId;
        this.watchId = watchId;
        this.quantity = quantity;
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

    @Override
    public String toString() {
        return "Cart [id=" + id + ", userId=" + userId + ", watchId=" + watchId + ", quantity=" + quantity + "]";
    }
}
