<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container my-5">
    <h2 class="fw-bold text-center mb-4 text-danger">🔥 Special Offers</h2>

    <!-- Bootstrap Carousel -->
    <div id="offersCarousel" class="carousel slide" data-bs-ride="carousel">
        <!-- Indicators -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#offersCarousel" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#offersCarousel" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#offersCarousel" data-bs-slide-to="2"></button>
        </div>

        <div class="carousel-inner rounded shadow">
            <div class="carousel-item active">
                <img src="Assets/offer1.jpg" class="d-block w-100 carousel-img" alt="Offer 1">
            </div>
            <div class="carousel-item">
                <img src="Assets/offer4.jpg" class="d-block w-100 carousel-img" alt="Offer 2">
            </div>
            <div class="carousel-item">
                <img src="Assets/offer5.jpg" class="d-block w-100 carousel-img" alt="Offer 3">
            </div>
        </div>

        <!-- Controls -->
        <button class="carousel-control-prev" type="button" data-bs-target="#offersCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#offersCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <div class="text-center mt-4">
        <a href="products.jsp" class="btn btn-danger btn-lg">Shop Now</a>
    </div>
</div>

<style>
    /* Make all carousel images same height and cover the area */
    .carousel-img {
        height: 400px; /* Fixed height for uniformity */
        object-fit: cover; /* Crop/scale image to fill */
    }
</style>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
