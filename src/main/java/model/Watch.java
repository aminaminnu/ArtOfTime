package model;

import java.math.BigDecimal;

public class Watch {
    private int id;
    private String name;
    private BigDecimal price;
    private String brand;
    private String image;
    private int quantity; // Added quantity field

    // Constructors
    public Watch() {}

    public Watch(int id, String name, BigDecimal price, String brand, String image, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.brand = brand;
        this.image = image;
        this.quantity = quantity;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() { // Getter for quantity
        return quantity;
    }

    public void setQuantity(int quantity) { // Setter for quantity
        this.quantity = quantity;
    }
}
