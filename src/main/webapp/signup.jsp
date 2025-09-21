<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
      crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
        crossorigin="anonymous"></script>

<script>
function showSubOption() {
    var userType = document.getElementById("userType").value;
    var subOptionDiv = document.getElementById("subOptionDiv");

    if (userType === "user") {
        subOptionDiv.style.display = "block";
    } else {
        subOptionDiv.style.display = "none";
    }
}
</script>

<style>
/* Main container for two sections */
.container-form {
    display: flex;
    height: 100vh;
    align-items: center;
    justify-content: center;
    background-image: url('Assets/loginsample.jpg'); /* Background for full page */
    background-size: cover;
    background-position: center;
    padding: 20px;
}

/* Left section (empty for now, can be used for images/text) */
.left-section {
    flex: 1;
}

/* Right section (form container) */
.right-section {
    flex: 1;
    display: flex;
    justify-content: center;
}

/* Form styling only */
.form-container {
    background: rgba(255, 255, 255, 0.15); /* transparent white */
    backdrop-filter: blur(15px); /* blur background behind form */
    padding: 40px 35px;
    border-radius: 16px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    max-width: 420px;
    width: 100%;
    text-align: center;
    transition: transform 0.3s ease;
    border: 1px solid rgba(255, 255, 255, 0.3); /* subtle border */
}
.form-container input, 
.form-container select {
    background: rgba(255, 255, 255, 0.7);
    border: none;
}


.form-container:hover {
    transform: scale(1.02);
}

.form-container h2 {
    margin-bottom: 25px;
    color: #800000;
    font-weight: 700;
    font-size: 28px;
}

/* Input and select styling */
.form-container input, 
.form-container select {
    width: 100%;
    padding: 12px 15px;
    margin-bottom: 18px;
    border-radius: 12px;
    border: 1px solid #ced4da;
    background-color: #f8f9fa;
    font-size: 15px;
    transition: border-color 0.3s, box-shadow 0.3s;
}

.form-container input:focus,
.form-container select:focus {
    border-color: #800000;
    box-shadow: 0 0 8px rgba(13, 110, 253, 0.25);
    outline: none;
}

/* Labels */
.form-container label {
    font-weight: 500;
    display: block;
    margin-bottom: 6px;
    text-align: left;
}

/* Submit button */
.form-container button {
    width: 100%;
    padding: 12px;
    background: linear-gradient(90deg, #800000, #0b5ed7);
    color: white;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 12px;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
}

.form-container button:hover {
    background: linear-gradient(90deg, #800000, #0a58ca);
}

/* Sub-option section for customer type */
#subOptionDiv {
    display: none;
    margin-top: 10px;
}
/* Hidden customer type section */
#subOptionDiv {
    display: none;
}
</style>
</head>
<body>
    <div class="container-form">
       

        <!-- Right side (Form) -->
        <div class="right-section">
            <form action="save.jsp" method="post" class="form-container">
                <h2>Sign Up</h2>

                <input type="text" placeholder="Enter your first name" name="fname" required>
                <input type="text" placeholder="Enter your last name" name="lname" required>
                <input type="tel" placeholder="Enter your Number" name="phone" required>
                <input type="email" id="email" name="email" placeholder="Enter Your Email" required>
                <input type="password" id="password" name="password" placeholder="Enter Your Password" required>

                <label>User Type:</label>
                <select name="utype" id="userType" onchange="showSubOption()">
                    <option value="admin">Admin</option>
                    <option value="user">Customer</option>
                </select>

                <!-- Sub-option for Customer -->
                <div id="subOptionDiv">
                    <label>Customer Type:</label>
                    <select name="ctype">
                        <option value="buyer">Buyer</option>
                        <option value="seller">Seller</option>
                    </select>
                </div>
         
                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
