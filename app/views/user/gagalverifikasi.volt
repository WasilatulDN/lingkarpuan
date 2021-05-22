<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Halaman Tidak Ditemukan</title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico"/>
	<link href="{{url('assets/css/loader.css')}}" rel="stylesheet" type="text/css" />
	<script src="{{url('assets/js/loader.js')}}"></script>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet">
	<link href="{{url('bootstrap/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css" />
	<link href="{{url('assets/css/plugins.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{url('assets/css/pages/error/style-400.css')}}" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    
</head>
<body class="error404 text-center">

    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->
    
    <div class="container-fluid error-content">
        <div class="">
            <p class="mini-text">Verifikasi Gagal</p>
            <p class="error-text mb-4 mt-1">Silakan coba verifikasi kembali melalui email anda</p>
        </div>
    </div>    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    
    <script>


        var switchFunctionality1 = {

            setDefaults: function() {

                if (Cookies.getCookie('dark_mode') != "") {
                    var loaderElement = document.querySelector('#load_screen');
                    setTimeout( function() {
                        loaderElement.style.display = "none";
                        console.log('Inside app.js me')
                    }, 3000);
                    window.scrollTo(0, 0);
                } else {
                    console.log('no needs of else;');
                }
            }

        }


        switchFunctionality1.setDefaults();

    </script>

</body>
</html>