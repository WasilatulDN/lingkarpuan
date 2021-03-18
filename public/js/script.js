$(document).ready(function () {
    //toggle sidebar di navbar
    $('#nav-side').click(function (e) {
        $('.sidebar').toggleClass('active');
        $('.nav').toggleClass('noshadow');
    });

    $('#nav-btn').click(function (e) {
        $('.side-menu').toggleClass('active');
    });

    $(window).scroll(function() {
        var scroll = $(window).scrollTop();

        if (scroll >= 200) {
            $(".nav").addClass("scrolled");
            $(".nav-btn").addClass("scrolled");
            $(".nav-dropdown-btn > a").addClass("scrolled");
            $(".white-nav").addClass("active");
            $(".red-nav").removeClass("active");
        } else {
            $(".nav").removeClass("scrolled");
            $(".nav-btn").removeClass("scrolled");
            $(".white-nav").removeClass("active");
            $(".red-nav").addClass("active");
            $(".nav-dropdown-btn > a").removeClass("scrolled");
        }
    });

    //Tanggal hari ini
    var d = new Date();
    var month = d.getMonth() + 1;
    var day = d.getDate();

    var hariIni =
        (('' + day).length < 2 ? '0' : '') + day  + '/' +
        (('' + month).length < 2 ? '0' : '') + month + '/'
        + d.getFullYear();

    $('.date-today').html(hariIni);

    $('.input-file').change(function (){
        $('.file-return').html($('.input-file').val());
    });
});
