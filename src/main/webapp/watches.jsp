<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    /* Ensure all videos fill their containers properly */
    video {
        object-fit: cover;
        width: 100%;
        height: 100%;
        border-radius: 0.5rem; /* matches Bootstrap rounded */
    }
</style>

<!-- ================= CARD SECTION (By Material) ================= -->
<div class="container my-5">
    <h2 class="fw-bold text-center mb-4">Watches by Material</h2>
    <div class="row g-4">
        <!-- Gold Watch -->
        <div class="col-md-4">
            <div class="card border-0 shadow-sm text-center overflow-hidden">
                <video class="card-img-top" autoplay loop muted playsinline>
                    <source src="Assets/videos/gold-watch.mp4" type="video/mp4">
                </video>
                <div class="card-body">
                    <h5 class="fw-bold">Gold Watches</h5>
                    <p class="text-muted">Timeless luxury crafted in solid gold.</p>
                </div>
            </div>
        </div>

        <!-- Diamond Watch -->
        <div class="col-md-4">
            <div class="card border-0 shadow-sm text-center overflow-hidden">
                <video class="card-img-top" autoplay loop muted playsinline>
                    <source src="Assets/videos/diamond-watch.mp4" type="video/mp4">
                </video>
                <div class="card-body">
                    <h5 class="fw-bold">Diamond Watches</h5>
                    <p class="text-muted">Sparkling brilliance for every occasion.</p>
                </div>
            </div>
        </div>

        <!-- Platinum Watch -->
        <div class="col-md-4">
            <div class="card border-0 shadow-sm text-center overflow-hidden">
                <video class="card-img-top" autoplay loop muted playsinline>
                    <source src="Assets/videos/platinum-watch.mp4" type="video/mp4">
                </video>
                <div class="card-body">
                    <h5 class="fw-bold">Platinum Watches</h5>
                    <p class="text-muted">Rare elegance with unmatched strength.</p>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- ================= VIDEO SECTION (By Style) ================= -->
<div class="container my-5">
    <h2 class="fw-bold text-center mb-4">Watches by Style</h2>
    <div class="row g-4">
        <!-- Work Watch -->
        <div class="col-md-4">
            <div class="ratio ratio-16x9 rounded shadow overflow-hidden">
                <video autoplay loop muted playsinline>
                    <source src="Assets/videos/work-watch.mp4" type="video/mp4">
                </video>
            </div>
            <h5 class="text-center mt-2">Work Watches</h5>
        </div>

        <!-- Sport Watch -->
        <div class="col-md-4">
            <div class="ratio ratio-16x9 rounded shadow overflow-hidden">
                <video autoplay loop muted playsinline>
                    <source src="Assets/videos/sport-watch.mp4" type="video/mp4">
                </video>
            </div>
            <h5 class="text-center mt-2">Sport Watches</h5>
        </div>

        <!-- Gift Watch -->
        <div class="col-md-4">
            <div class="ratio ratio-16x9 rounded shadow overflow-hidden">
                <video autoplay loop muted playsinline>
                    <source src="Assets/videos/gift-watch.mp4" type="video/mp4">
                </video>
            </div>
            <h5 class="text-center mt-2">Gift Watches</h5>
        </div>
    </div>
</div>

