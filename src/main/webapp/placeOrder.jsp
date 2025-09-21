<%@ page import="java.util.*, java.sql.*, model.CartDao, model.Watch, model.WatchDAO, model.OrderDao" %>

<%
    // ✅ Retrieve userId from session
    HttpSession sessionObj = request.getSession();
    Integer userId = (Integer) sessionObj.getAttribute("userId");

    if (userId == null) {
        response.sendRedirect("login3.jsp");
        return;
    }

    // Retrieve parameters
    String watchIdParam = request.getParameter("watchId");
    String orderAllParam = request.getParameter("orderAll");

    // Initialize DAO objects
    CartDao cartDao = new CartDao();
    OrderDao orderDao = new OrderDao();

    if (orderAllParam != null) {
        // ✅ "Order All" case
        System.out.println("Placing all orders...");

        // Get all cart items for this user
        List<Watch> cartItems = cartDao.getCartItems(userId);

        for (Watch watch : cartItems) {
            // Place order for each item
            orderDao.placeOrder(userId, watch.getId(), watch.getQuantity());
        }

        // Clear the cart after ordering
        cartDao.clearCart(userId);

        response.sendRedirect("orderSuccess.jsp");
    } else if (watchIdParam != null) {
        // ✅ Single Order case
        int watchId = Integer.parseInt(watchIdParam);
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        System.out.println("Placing single order for watchId: " + watchId + ", quantity: " + quantity);

        // Get watch price from database
        WatchDAO watchDao = new WatchDAO();
        Watch watch = watchDao.getWatchById(watchId);

        // Place single order ✅ Fix: Pass watchId & quantity
        orderDao.placeOrder(userId, watchId, quantity);

        // Remove item from cart after ordering
        cartDao.removeFromCart(userId, watchId);

        response.sendRedirect("orderSuccess.jsp");
    } else {
        System.out.println("No valid order request found.");
        response.sendRedirect("cart.jsp");
    }
%>
