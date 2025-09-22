⌚ Art of Time – Watch Portal

A JSP-based web application for buying and selling watches.
This project allows customers to purchase watches, sellers to list their products, and admins to manage the platform.

🚀 Features

👤 User Authentication (Admin / Customer)

🛒 Buyers

View available watches

Add watches to cart

Place orders (Buy Now)

🏬 Sellers

Register and sell watches

View and manage their listings

🔧 Admin

Manage buyers, sellers, and products

🛠 Tech Stack

Frontend: JSP, HTML, CSS, Bootstrap

Backend: Java (JSP + JDBC)

Database: MySQL

Tools: Apache Tomcat, Git, GitHub

📂 Database Structure

Users → stores user details (fname, lname, phone, role)

Login → handles authentication (email, password)

Cart → manages cart items (id, user_id, watch_id, quantity)

Orders → stores order details (id, user_id, watch_id, quantity, total_price, order_date)

⚙️ Setup Instructions

1.Clone this repository
```bash
git clone https://github.com/aminaminnu/ArtOfTime.git
````
2.Import into your IDE (Eclipse/IntelliJ).

3.Configure Apache Tomcat server.

4.Import the SQL file into MySQL.

5.Run the project and access via:
```bash
http://localhost:8080/ArtOfTime
```
## Screenshot of Art of Time
![Art of Time Website](assets/home2.png)


👩‍💻 Author

Amina – Developer of Art of Time
