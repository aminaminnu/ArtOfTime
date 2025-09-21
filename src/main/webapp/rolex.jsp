<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
/* ✅ Make Rolex banner & video like index carousel */
.rolex-banner,
.rolex-video {
    height: 400px;         /* same as index carousel */
    width: 100%;
    object-fit: cover;     /* crop instead of stretching */
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}
</style>

<!-- Rolex Banner & Collections -->
<div class="container my-5">
    <div class="text-center mb-5">
        <img src="Assets/rolex-banner.jpg" class="rolex-banner" alt="Rolex Banner">
        <h2 class="fw-bold mt-3">Rolex Collections</h2>
    </div>

    <div class="row g-4">
        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <img src="Assets/Rolex1.jpg" class="card-img-top" alt="Rolex 1">
                <div class="card-body text-center">
                    <h6 class="fw-bold">Rolex Model 1</h6>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <img src="Assets/rolex2.jpg" class="card-img-top" alt="Rolex 2">
                <div class="card-body text-center">
                    <h6 class="fw-bold">Rolex Model 2</h6>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <img src="Assets/Rolex3.jpg" class="card-img-top" alt="Rolex 3">
                <div class="card-body text-center">
                    <h6 class="fw-bold">Rolex Model 3</h6>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card border-0 shadow-sm">
                <img src="Assets/Rolex4.jpg" class="card-img-top" alt="Rolex 4">
                <div class="card-body text-center">
                    <h6 class="fw-bold">Rolex Model 4</h6>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Video Section (Bottom, Thin Like Carousel) -->
<div class="container-fluid p-0 mt-5">
    <video class="rolex-video" autoplay loop muted playsinline>
        <source src="Assets/videos/rolex.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>
</div>
