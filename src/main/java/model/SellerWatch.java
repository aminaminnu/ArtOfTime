package model;

import java.math.BigDecimal;

public class SellerWatch {
    private int id;
    private int sellerid;
    private String watchname;
    private String brand;
    private String model;
    private String watchcondition;
    private  BigDecimal price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSellerid() {
		return sellerid;
	}
	public void setSellerid(int sellerid) {
		this.sellerid = sellerid;
	}
	public String getWatchname() {
		return watchname;
	}
	public void setWatchname(String watchname) {
		this.watchname = watchname;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getWatchcondition() {
		return watchcondition;
	}
	public void setWatchcondition(String watchcondition) {
		this.watchcondition = watchcondition;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public SellerWatch(int id, int sellerid, String watchname, String brand, String model, String watchcondition,
			BigDecimal price) {
		super();
		this.id = id;
		this.sellerid = sellerid;
		this.watchname = watchname;
		this.brand = brand;
		this.model = model;
		this.watchcondition = watchcondition;
		this.price = price;
	}
	public SellerWatch() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "SellerWatch [id=" + id + ", sellerid=" + sellerid + ", watchname=" + watchname + ", brand=" + brand
				+ ", model=" + model + ", watchcondition=" + watchcondition + ", price=" + price + "]";
	}

}
