package model;

public class Wishlist {
    private int id;
    private int userId;
    private int watchId;

    public Wishlist() {}

    public Wishlist(int id, int userId, int watchId) {
        this.id = id;
        this.userId = userId;
        this.watchId = watchId;
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
}
