<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Watch Brands</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .brand-card {
        transition: transform 0.3s, box-shadow 0.3s;
        cursor: pointer;
    }
    .brand-card:hover {
        transform: scale(1.05);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
    }
    .brand-logo {
        height: 120px;
        object-fit: contain;
    }
</style>
</head>
<body class="bg-light">

<div class="container py-5">
   

    <h2 class="text-center mb-4 fw-bold">⌚ Explore Watch Brands</h2>
    <div class="row g-4">

        <!-- Rolex -->
        <div class="col-md-4 col-sm-6">
            <div class="card brand-card text-center" data-bs-toggle="modal" data-bs-target="#rolexModal">
                <img src="Assets/icons/rolex-logo.png" class="card-img-top brand-logo p-3" alt="Rolex">
                <div class="card-body">
                    <h5 class="card-title">Rolex</h5>
                    <p class="card-text">Luxury and Prestige since 1905.</p>
                </div>
            </div>
        </div>

        <!-- Omega -->
        <div class="col-md-4 col-sm-6">
            <div class="card brand-card text-center" data-bs-toggle="modal" data-bs-target="#omegaModal">
                <img src="Assets/icons/omega-logo.png" class="card-img-top brand-logo p-3" alt="Omega">
                <div class="card-body">
                    <h5 class="card-title">Omega</h5>
                    <p class="card-text">Precision timepieces and moon pioneers.</p>
                </div>
            </div>
        </div>

        <!-- Casio -->
        <div class="col-md-4 col-sm-6">
            <div class="card brand-card text-center" data-bs-toggle="modal" data-bs-target="#casioModal">
                <img src="Assets/icons/casio-logo.png" class="card-img-top brand-logo p-3" alt="Casio">
                <div class="card-body">
                    <h5 class="card-title">Casio</h5>
                    <p class="card-text">Smart, digital, and affordable.</p>
                </div>
            </div>
        </div>

        <!-- Fossil -->
        <div class="col-md-4 col-sm-6">
            <div class="card brand-card text-center" data-bs-toggle="modal" data-bs-target="#fossilModal">
                <img src="Assets/icons/fossil-logo.png" class="card-img-top brand-logo p-3" alt="Fossil">
                <div class="card-body">
                    <h5 class="card-title">Fossil</h5>
                    <p class="card-text">Vintage style meets modern watchmaking.</p>
                </div>
            </div>
        </div>

        <!-- Seiko -->
        <div class="col-md-4 col-sm-6">
            <div class="card brand-card text-center" data-bs-toggle="modal" data-bs-target="#seikoModal">
                <img src="Assets/icons/seiko-logo.png" class="card-img-top brand-logo p-3" alt="Seiko">
                <div class="card-body">
                    <h5 class="card-title">Seiko</h5>
                    <p class="card-text">Innovation and quality craftsmanship from Japan.</p>
                </div>
            </div>
        </div>

        <!-- Titan -->
        <div class="col-md-4 col-sm-6">
            <div class="card brand-card text-center" data-bs-toggle="modal" data-bs-target="#titanModal">
                <img src="Assets/icons/titan-logo.png" class="card-img-top brand-logo p-3" alt="Titan">
                <div class="card-body">
                    <h5 class="card-title">Titan</h5>
                    <p class="card-text">Style, innovation, and affordability from India.</p>
                </div>
            </div>
        </div>

    </div>
</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
