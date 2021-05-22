{% extends "layouts/base.volt" %}

{% block title %}Halaman Awal{% endblock %}



{% block content %}
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="assets/img/carousel_1.jpg" alt="First slide">
            <div class="carousel-caption d-none d-sm-block">
                <h3 style="color: #000000">Menemani, mendampingi, membersamai</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="assets/img/carousel_2.jpg" alt="Second slide">
            <div class="carousel-caption d-none d-sm-block">
                <h3 style="color: #000000">Bagikan edukasi seputar kekerasan terhadap perempuan</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="assets/img/carousel_3.jpg" alt="Third slide">
            <div class="carousel-caption d-none d-sm-block">
                <h3 style="color: #000000">Temukan komunitas yang ramah perempuan</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="assets/img/carousel_4.jpg" alt="Fourth slide">
            <div class="carousel-caption d-none d-sm-block">
                <h3 style="color: #000000">Konsultasikan masalahmu bersama tenaga profesional</h3>
                <h3 style="color: #000000">lingkar puan</h3>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
{% endblock %}