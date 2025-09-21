<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Failed</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 20px; }
        .container { max-width: 400px; margin: auto; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); }
        .error { color: red; font-size: 20px; }
        .btn { display: inline-block; margin-top: 15px; padding: 10px 15px; text-decoration: none; color: white; border-radius: 5px; background: #dc3545; }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="error">❌ Order Failed!</h2>
        <p>Something went wrong. Your order was not placed.</p>
        <a href="cart.jsp" class="btn">Go Back to Cart</a>
    </div>

</body>
</html>
