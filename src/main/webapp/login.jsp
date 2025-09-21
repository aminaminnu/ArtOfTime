<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        crossorigin="anonymous"></script>

<style>
body, html {
    height: 100%;
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.container-form {
    display: flex;
    height: 100vh;
}

/* Left section with image */
.left-section {
    flex: 1;
    background-image: url('Assets/loginsample.jpg'); /* Update with your path */
    background-size: cover;
    background-position: center;
}

/* Right section with gradient and centered form */
.right-section {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #800000, #ffffff);
}

/* Stylish form container */
.form-container {
    background: #ffffff;
    padding: 50px 40px;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    width: 100%;
    max-width: 400px;
    text-align: center;
}
/* Stylish transparent form container */
.form-container {
    background: rgba(255, 255, 255, 0.2); /* transparent white */
    backdrop-filter: blur(15px); /* blur effect behind the form */
    padding: 50px 40px;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    width: 100%;
    max-width: 400px;
    text-align: center;
    border: 1px solid rgba(255, 255, 255, 0.3); /* subtle border */
}

/* Heading */
.form-container h2 {
    margin-bottom: 30px;
    font-weight: 600;
    color: #800000;
}

/* Input styling */
.form-container input {
    width: 100%;
    padding: 12px 15px;
    margin-bottom: 20px;
    border-radius: 12px;
    border: 1px solid #ccc;
    transition: all 0.3s ease-in-out;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
}

.form-container input:focus {
    border-color: #007bff;
    outline: none;
    box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
}

/* Button styling */
.form-container button {
    width: 100%;
    padding: 12px;
    background-color: #800000;
    color: white;
    border: none;
    border-radius: 12px;
    font-size: 16px;
    font-weight: 600;
    transition: background-color 0.3s ease-in-out;
}

.form-container button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>
    <div class="container-form">
        <!-- Left side with image -->
        <div class="left-section"></div>

        <!-- Right side with styled form -->
        <div class="right-section">
            <form action="logincheck.jsp" method="post" class="form-container">
                <h2>Login Here</h2>
                <input type="text" placeholder="Enter your email" name="email" required>
                <input type="password" placeholder="Enter your password" name="password" required>
                <button type="submit">Login</button>
            </form>
        </div>
    </div>
</body>
</html>
