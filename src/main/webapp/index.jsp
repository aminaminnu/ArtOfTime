<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, model.Watch, model.WatchDAO"%>
<%
WatchDAO watchDAO = new WatchDAO();
List<Watch> watches = watchDAO.getAllWatches();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Amis Watches</title>

<!-- Google Fonts (Roboto & Lato) -->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&family=Lato:wght@300;400;700&display=swap"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome for Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
/* General Styling */
body {
	font-family: 'Playfair Display', serif;
	color: #333;
	background-color: #f8f9fa;
}
/* Fixing the navbar at the top */
h1, h2, h3, h4, h5, h6 {
	font-family: 'Playfair Display', serif;
	font-weight: 500;
}

/* Navbar Styling */
.top-navbar {
	background-color: white;
}

.top-navbar {
	font-size: 14px;
	color: black;
}

.navbar-brand {
	font-weight: bold;
	font-size: 28px;
	color: black;
}

.navbar a {
	color: black;
	text-decoration: none;
}

.navbar a:hover {
	color: #ffb800;
}

.navbar .icon {
	width: 16px;
	height: 16px;
}

#heroCarousel {
	height: 33vw; /* Maintains a 3:1 aspect ratio based on viewport width */
	max-height: 640px; /* Prevents excessive height on large screens */
	overflow: hidden;
}

#heroCarousel .carousel-item {
	height: 100%;
}

#heroCarousel .carousel-item img {
	height: 400px;
	width: 100%;
	object-fit: cover;
}

/* Buttons */
.btn-success {
	background-color: #046307;
	border: none;
	font-weight: 500;
}

.btn-success:hover {
	background-color: #024b05;
}

.btn-primary {
	background-color: #007bff;
	border: none;
	font-weight: 500;
}

.btn-primary:hover {
	background-color: #0056b3;
}

/* Card Styling */
.card {
	max-width: 300px;
	margin: 0 auto;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
}

.card:hover {
	transform: translateY(-5px);
}

.card-body {
	flex-grow: 1;
	text-align: center;
}

.card-title {
	font-size: 1.2rem;
	font-weight: 600;
	margin-bottom: 15px;
	color: #333;
}

.card-text {
	font-size: 1rem;
	color: #007bff;
	margin-bottom: 20px;
}

.card-footer {
	text-align: center;
	padding: 10px;
}

.card-footer a {
	color: #fff;
	background-color: #007bff;
	padding: 10px 20px;
	text-decoration: none;
	border-radius: 5px;
}

.card-footer a:hover {
	background-color: #0056b3;
}

/* Watch Cards Layout */
.col-md-4 {
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
}

.row {
	justify-content: center;
}

/* Main Navbar */
.main-navbar {
	background-color: white;
	padding: 10px 0;
}

.main-navbar a {
	color: black;
	font-family: 'Playfair Display', serif;
	text-decoration: none;
	margin-right: 20px;
	font-weight: 500;
}

.main-navbar a:hover {
	color: #ffb800;
}

.brand-name {
	font-family: 'Playfair Display', serif; /* Elegant Font */
	font-size: 28px; /* Bigger Size */
	font-weight: bold; /* Make it stand out */
	text-transform: uppercase; /* Capitalize for elegance */
	letter-spacing: 2px; /* More spacing for a premium feel */
	color: #8B0000; /* Deep red for luxury */
	text-decoration: none; /* Remove underline */
	transition: all 0.3s ease-in-out; /* Smooth hover effect */
}

.brand-name:hover {
	color: #C70039; /* Brighter red on hover */
	text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); /* Soft shadow */
}
/* Logo Styling */
.logo {
	height: 40px; /* Adjust size */
}

/* Brand Name Styling */
.brand-name {
	font-family: 'Playfair Display', serif;
	font-size: 24px;
	font-weight: bold;
	color: #8B0000;
	text-transform: uppercase;
	text-decoration: none;
}

/* Navbar Links Styling */
.nav-link {
	font-size: 16px;
	font-weight: bold;
	color: #333;
	text-decoration: none;
	transition: color 0.3s ease-in-out;
}

/* Hover Effect */
.nav-link:hover {
	color: #C70039;
}

/* Special Offers Link */
.text-danger {
	color: #DC3545 !important;
}

.card-img-top {
	width: 100%; /* Ensures images take the full width of the card */
	height: 200px; /* Set a fixed height for uniformity */
	object-fit: cover;
	/* Ensures images maintain aspect ratio while filling the space */
}

.watch-card {
	transition: transform 0.3s, box-shadow 0.3s;
	border-radius: 10px;
}

.watch-card:hover {
	transform: translateY(-5px);
	box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
}

.watch-img {
	width: 100%;
	height: 250px; /* Ensures uniform image size */
	object-fit: cover; /* Prevents distortion */
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.btn-warning {
	font-weight: bold;
	border-radius: 20px;
	transition: 0.3s ease;
}

.btn-warning:hover {
	background-color: #ffcc00;
	transform: scale(1.05);
}

.service-card {
	transition: transform 0.3s, box-shadow 0.3s;
	border-radius: 10px;
}

.service-card:hover {
	transform: translateY(-5px);
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
}

.btn-warning {
	border-radius: 20px;
}
</style>
</head>
<body>




	<!-- ✅ Top Navbar -->
	<nav class="navbar navbar-light bg-light py-1 top-navbar ">
		<div class="container-fluid d-flex justify-content-between">

			<!-- Left: Contact Numbers -->
			<div class="d-flex align-items-center">
				<img src="Assets/icons/smartphone_398881.png" alt="Phone" class="icon me-1">
				<span class="me-3">+91 87250 28882</span> <img
					src="Assets/icons/watsapp.gif" alt="WhatsApp" class="icon me-1"> <span
					class="me-3 text-success">+91 87250 28899</span>
			</div>

			<!-- Right: Wishlist, Cart, Login/Logout -->
			<div>
				<a href="wishlist.jsp" class="me-3"> <i class="fas fa-heart"></i>
					Wishlist
				</a> <a href="cart.jsp" class="me-3"> <i
					class="fas fa-shopping-cart"></i> Cart
				</a>

				<%
				String userEmail = (String) session.getAttribute("userEmail"); // ✅ FIXED
				if (userEmail != null) {
				%>
				<!-- ✅ If logged in -->
				<span class="me-2 fw-bold text-dark"> <i
					class="fas fa-user-circle"></i> <%=userEmail%>
				</span> <a href="logout.jsp" class="btn btn-danger btn-sm ms-2"> <i
					class="fas fa-sign-out-alt"></i> Logout
				</a>
				<%
				} else {
				%>
				<!-- ❌ If not logged in -->
				<a href="login.jsp"><i class="fas fa-user"></i> Login</a> or <a
					href="signup.jsp" class="ms-1"><i class="fas fa-user-plus"></i>
					Signup</a>
				<%
				}
				%>
			</div>
		</div>
	</nav>


	<!-- ✅ Main Navbar -->
	<div class="container-fluid mb-4 main-navbar">
		<div
			class="d-flex align-items-center justify-content-between py-3 px-4">

			<!-- Logo & Brand Name -->
			<div class="d-flex align-items-center">
				<a href="#" class="brand-name ms-2">Art Of Time</a>
			</div>

			<!-- ✅ Updated Menu Items -->
			<div class="d-flex gap-4">
				<!-- Modal-powered links -->
				<a href="#" class="fw-bold nav-link modal-link"
					data-page="brands.jsp">Brands</a> <a href="#"
					class="fw-bold nav-link modal-link" data-page="rolex.jsp">Rolex</a>
				<a href="#" class="fw-bold nav-link modal-link"
					data-page="watches.jsp">Watches</a> <a href="#"
					class="fw-bold nav-link text-danger modal-link"
					data-page="offers.jsp">Special Offers</a>

				<!-- Keep existing modals -->
				<a href="#" class="fw-bold nav-link" data-bs-toggle="modal"
					data-bs-target="#buyWatchModal">Buy a Watch</a> <a href="#"
					class="fw-bold nav-link" data-bs-toggle="modal"
					data-bs-target="#sellWatchModal">Sell a Watch</a>

				<!-- Other sections -->
				<a href="#contact_section" class="fw-bold nav-link">Contact Us</a> <a
					href="#service_section" class="fw-bold nav-link">Repair &
					Service</a>
			</div>

		</div>
	</div>


	<!-- Hero Section (Carousel) -->
	<div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#heroCarousel"
				data-bs-slide-to="0" class="active"></button>
			<button type="button" data-bs-target="#heroCarousel"
				data-bs-slide-to="1"></button>
		</div>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="Assets/banner2.jpg" class="d-block w-100"
					alt="Luxury Watches">
				<div class="carousel-caption text-start">
					<h1 class="fw-bold">Explore World Of Watches</h1>

				</div>
			</div>
			<div class="carousel-item">
				<img src="Assets/poster.jpg" class="d-block w-100"
					alt="Premium Watches">
			</div>

		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#heroCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#heroCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>


	<!-- Universal Modal for Brands/Rolex/Jewellery/Offers -->
<div class="modal fade" id="contentModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered modal-fullscreen-sm-down">
    <div class="modal-content shadow-lg border-0 rounded-3">
      <div class="modal-header bg-dark text-white">
        <h5 class="modal-title">Loading...</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body p-4">
        <div id="modalContent" class="text-center">
          <div class="spinner-border text-danger" role="status">
            <span class="visually-hidden">Loading...</span>
          </div>
          <p class="mt-2">Fetching content...</p>
        </div>
      </div>
    </div>
  </div>
</div>
	


	<!-- ✅ Buy a Watch Modal -->
	<div class="modal fade" id="buyWatchModal" tabindex="-1"
		aria-labelledby="buyWatchLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="buyWatchLabel">Buy Your Dream
						Watch</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Browse through our collection of luxury watches and pick the
						one that suits your style!</p>
					<ul>
						<li>Variety of styles to choose from</li>
						<li>Best deals and prices</li>
						<li>Fast and secure delivery</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="products.jsp" class="btn btn-success">Shop Now</a>
				</div>
			</div>
		</div>
	</div>


	<!-- ✅ Sell a Watch Modal -->
	<div class="modal fade" id="sellWatchModal" tabindex="-1"
		aria-labelledby="sellWatchLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="sellWatchLabel">Sell Your Watch</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Do you have a luxury watch to sell? List your watch on Amis
						Watches and connect with potential buyers.</p>
					<ul>
						<li>Easy & secure selling process</li>
						<li>Trusted platform for luxury watches</li>
						<li>Get the best value for your watch</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="addWatch.jsp" class="btn btn-success">Sell Now</a>
				</div>
			</div>
		</div>
	</div>


	<!-- Watch Cards Section -->
	<div class="container mt-4">
		<h2 class="text-center mb-4">Latest Watches</h2>
		<div class="row">
			<div class="col-md-2">
				<div class="card">
					<img src="Assets/luxury.jpg" class="card-img-top"
						alt="Luxury Watch">
					<div class="card-body">
						<h5 class="card-title">Luxury Watch</h5>
						<p class="card-text">$1999</p>
						<a href="addToCart.jsp?watchId=8"
							class="btn btn-warning rounded-pill px-4">Add to Cart</a>
							<a href="addToWishlist.jsp?watchId=8" class="btn btn-outline-danger rounded-pill px-4">
                        <i class="fas fa-heart"></i> Wishlist
                    </a>
					</div>
				</div>
			</div>

			<div class="col-md-2">
				<div class="card">
					<img src="Assets/elegant.jpg" class="card-img-top"
						alt="Elegant Watch">
					<div class="card-body">
						<h5 class="card-title">Elegant Watch</h5>
						<p class="card-text">$1599</p>
						<a href="addToCart.jsp?watchId=9"
							class="btn btn-warning rounded-pill px-4">Add to Cart</a>
							<a href="addToWishlist.jsp?watchId=9" class="btn btn-outline-danger rounded-pill px-4">
                        <i class="fas fa-heart"></i> Wishlist
                    </a>
					</div>
				</div>
			</div>

			<div class="col-md-2">
				<div class="card">
					<img src="Assets/classic.jpg" class="card-img-top"
						alt="Classic Watch">
					<div class="card-body">
						<h5 class="card-title">Classic Watch</h5>
						<p class="card-text">$1299</p>
						<a href="addToCart.jsp?watchId=10"
							class="btn btn-warning rounded-pill px-4">Add to Cart</a>
							<a href="addToWishlist.jsp?watchId=10" class="btn btn-outline-danger rounded-pill px-4">
                        <i class="fas fa-heart"></i> Wishlist
                    </a>
					</div>
				</div>
			</div>

			<div class="col-md-2">
				<div class="card">
					<img src="Assets/stylish.jpg" class="card-img-top"
						alt="Stylish Watch">
					<div class="card-body">
						<h5 class="card-title">Stylish Watch</h5>
						<p class="card-text">$1099</p>
						<a href="addToCart.jsp?watchId=11"
							class="btn btn-warning rounded-pill px-4">Add to Cart</a>
							<a href="addToWishlist.jsp?watchId=11" class="btn btn-outline-danger rounded-pill px-4">
                        <i class="fas fa-heart"></i> Wishlist
                    </a>
					</div>
				</div>
			</div>

			<div class="col-md-2">
				<div class="card">
					<img src="Assets/modern.jpg" class="card-img-top"
						alt="Modern Watch">
					<div class="card-body">
						<h5 class="card-title">Modern Watch</h5>
						<p class="card-text">$999</p>
						<a href="addToCart.jsp?watchId=12"
							class="btn btn-warning rounded-pill px-4">Add to Cart</a>
							<a href="addToWishlist.jsp?watchId=12" class="btn btn-outline-danger rounded-pill px-4">
                        <i class="fas fa-heart"></i> Wishlist
                    </a>
					</div>
				</div>
			</div>

			<div class="col-md-2">
				<div class="card">
					<img src="Assets/sporty.jpg" class="card-img-top"
						alt="Sporty Watch">
					<div class="card-body">
						<h5 class="card-title">Sporty Watch</h5>
						<p class="card-text">$899</p>
						<a href="addToCart.jsp?watchId=13"
							class="btn btn-warning rounded-pill px-4">Add to Cart</a>
							<a href="addToWishlist.jsp?watchId=13" class="btn btn-outline-danger rounded-pill px-4">
                        <i class="fas fa-heart"></i> Wishlist
                    </a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- ✅ Promotional Banner Section -->
	<div class="container-fluid bg-dark text-white text-center py-5 my-5">
		<h2 class="display-4">Exclusive Offer</h2>
		<p class="lead">Get up to 20% off on selected watches. Don't miss
			out on this limited-time offer!</p>
		<a href="products.jsp" class="btn btn-success btn-lg">Shop Now</a>
	</div>

	<!-- ✅ Watch Service & Repair Section -->
	<div class="container my-5" id="service_section">
		<h2 class="text-center fw-bold mb-4">Watch Service & Repair</h2>

		<div class="row justify-content-center">
			<!-- Watch Repair -->
			<div class="col-md-4">
				<div class="card text-center border-0 shadow-sm p-4 service-card">
					<img src="Assets/icons/repair-time_17936346.png" alt="Watch Repair"
						width="80" class="mx-auto">
					<h4 class="mt-3 fw-bold">Watch Repair</h4>
					<p class="text-muted">Expert repair services using genuine
						parts to restore your watch.</p>
					<a href="#" class="btn btn-warning">Learn More</a>
				</div>
			</div>
			<!-- Battery Replacement -->
			<div class="col-md-4">
				<div class="card text-center border-0 shadow-sm p-4 service-card">
					<img src="Assets/icons/battery_17413976.png" alt="Battery Replacement"
						width="80" class="mx-auto">
					<h4 class="mt-3 fw-bold">Battery Replacement</h4>
					<p class="text-muted">Fast and reliable battery replacements
						for all watch brands.</p>
					<a href="#" class="btn btn-warning">Learn More</a>
				</div>
			</div>
			<!-- Watch Polishing -->
			<div class="col-md-4">
				<div class="card text-center border-0 shadow-sm p-4 service-card">
					<img src="Assets/icons/polishing.png" alt="Watch Polishing" width="80"
						class="mx-auto">
					<h4 class="mt-3 fw-bold">Watch Polishing</h4>
					<p class="text-muted">Professional polishing to restore your
						watch’s shine.</p>
					<a href="#" class="btn btn-warning">Learn More</a>
				</div>
			</div>
		</div>
	</div>


<!-- ✅ Featured Watches Section -->
<div class="container">
    <h2 class="text-center mt-5 mb-4">Featured Watches</h2>
    <div class="row">

        <!-- Static Watches (Manually Added) -->
        <div class="col-md-4 mb-4">
            <div class="card text-center border-0 shadow-lg watch-card">
                <img src="Assets/Rolex Submariner.jpg"
                     class="card-img-top watch-img" alt="Rolex Watch">
                <div class="card-body flex-grow-1">
                    <h5 class="card-title">Rolex Submariner Latest</h5>
                    <p class="card-text fw-bold text-muted">₹10,99,999</p>
                </div>
                <div class="card-footer bg-white d-flex justify-content-center gap-2">
                    <a href="addToCart.jsp?watchId=5"
                       class="btn btn-warning rounded-pill px-4"> 
                       <i class="fas fa-shopping-cart"></i> Add to Cart
                    </a>
                    <a href="addToWishlist.jsp?watchId=5"
                       class="btn btn-outline-danger rounded-pill px-4">
                       <i class="fas fa-heart"></i> Wishlist
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card text-center border-0 shadow-lg watch-card">
                <img src="Assets/Audemars Piguet Royal Oak.jpg"
                     class="card-img-top watch-img" alt="Audemars Piguet Watch">
                <div class="card-body flex-grow-1">
                    <h5 class="card-title">Audemars Piguet Royal Oak</h5>
                    <p class="card-text fw-bold text-muted">₹15,50,000</p>
                </div>
                <div class="card-footer bg-white d-flex justify-content-center gap-2">
                    <a href="addToCart.jsp?watchId=6"
                       class="btn btn-warning rounded-pill px-4"> 
                       <i class="fas fa-shopping-cart"></i> Add to Cart
                    </a>
                    <a href="addToWishlist.jsp?watchId=6"
                       class="btn btn-outline-danger rounded-pill px-4">
                       <i class="fas fa-heart"></i> Wishlist
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card text-center border-0 shadow-lg watch-card">
                <img src="Assets/Patek Philippe Nautilus.jpg"
                     class="card-img-top watch-img" alt="Patek Philippe Watch">
                <div class="card-body flex-grow-1">
                    <h5 class="card-title">Patek Philippe Nautilus</h5>
                    <p class="card-text fw-bold text-muted">₹25,00,000</p>
                </div>
                <div class="card-footer bg-white d-flex justify-content-center gap-2">
                    <a href="addToCart.jsp?watchId=7"
                       class="btn btn-warning rounded-pill px-4"> 
                       <i class="fas fa-shopping-cart"></i> Add to Cart
                    </a>
                    <a href="addToWishlist.jsp?watchId=7"
                       class="btn btn-outline-danger rounded-pill px-4">
                       <i class="fas fa-heart"></i> Wishlist
                    </a>
                </div>
            </div>
        </div>

    </div>
</div>

			<!-- Contact Section -->
			<div class="container my-5" id="contact_section">
				<h2 class="text-center mb-4">Contact Us</h2>
				<div class="row">
					<!-- Google Map -->
					<div class="col-md-6 mb-4">
						<div class="h-100">
							<iframe width="100%" height="400" frameborder="0"
								style="border: 0;" allowfullscreen
								src="https://www.google.com/maps?q=New+York&output=embed">
							</iframe>
						</div>
					</div>

					<!-- Contact Form -->
					<div class="col-md-6 mb-4">
						<div class="card p-4 shadow">
							<h4 class="mb-3">Get in Touch</h4>
							<form>
								<div class="mb-3">
									<label for="name" class="form-label">Full Name</label> <input
										type="text" class="form-control" id="name"
										placeholder="Enter your name" required>
								</div>
								<div class="mb-3">
									<label for="email" class="form-label">Email Address</label> <input
										type="email" class="form-control" id="email"
										placeholder="Enter your email" required>
								</div>
								<div class="mb-3">
									<label for="message" class="form-label">Message</label>
									<textarea class="form-control" id="message" rows="4"
										placeholder="Your message..." required></textarea>
								</div>
								<button type="submit" class="btn btn-success w-100">Send
									Message</button>
							</form>
						</div>
					</div>
				</div>
			</div>


			<!-- Bootstrap JS -->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

			<script>document.querySelectorAll(".modal-link").forEach(link => {
  link.addEventListener("click", function(e) {
    e.preventDefault();
    let page = this.getAttribute("data-page");
    let title = this.textContent.trim();

    // Set modal title
    document.querySelector("#contentModal .modal-title").innerText = title;

    // Reset modal body with spinner
    document.getElementById("modalContent").innerHTML = `
      <div class="text-center">
        <div class="spinner-border text-danger" role="status">
          <span class="visually-hidden">Loading...</span>
        </div>
        <p class="mt-2">Loading ${title}...</p>
      </div>
    `;

    // Show modal
    let modal = new bootstrap.Modal(document.getElementById('contentModal'));
    modal.show();

    // Load JSP into modal body
    fetch(page)
      .then(res => {
        if (!res.ok) throw new Error("Network response was not ok");
        return res.text();
      })
      .then(data => {
        document.getElementById("modalContent").innerHTML = data;
      })
      .catch(err => {
        document.getElementById("modalContent").innerHTML =
          "<p class='text-danger text-center'>❌ Failed to load content. Please try again.</p>";
        console.error("Error loading modal content:", err);
      });
  });
});
			</script>
			
</html>
