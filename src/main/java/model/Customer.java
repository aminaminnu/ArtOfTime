package model;

public class Customer {
 private int id;
 private String fname;
 private String lname;
 private Long phone;
 private String utype;
 private String email;
 private String password;
 private String ctype;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getLname() {
	return lname;
}
public void setLname(String lname) {
	this.lname = lname;
}
public Long getPhone() {
	return phone;
}
public void setPhone(Long phone) {
	this.phone = phone;
}
public String getUtype() {
	return utype;
}
public void setUtype(String utype) {
	this.utype = utype;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getCtype() {
	return ctype;
}
public void setCtype(String ctype) {
	this.ctype = ctype;
}
public Customer(int id, String fname, String lname, Long phone, String utype, String email, String password,
		String ctype) {
	super();
	this.id = id;
	this.fname = fname;
	this.lname = lname;
	this.phone = phone;
	this.utype = utype;
	this.email = email;
	this.password = password;
	this.ctype = ctype;
}
 public Customer() {

 }
@Override
public String toString() {
	return "Customer [id=" + id + ", fname=" + fname + ", lname=" + lname + ", phone=" + phone + ", utype=" + utype
			+ ", email=" + email + ", password=" + password + ", ctype=" + ctype + "]";
}

}
