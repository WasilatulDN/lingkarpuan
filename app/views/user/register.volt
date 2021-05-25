<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Buat Akun - Lingkar Puan</title>
    <link rel="icon" type="image/x-icon" href="{{url('assets/img/favicon.ico')}}"/>
    <link href="{{url('assets/css/loader.css')}}" rel="stylesheet" type="text/css" />
    <script src="{{url('assets/js/loader.js')}}"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,500,600,700&display=swap" rel="stylesheet">
    <link href="{{url('bootstrap/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{url('assets/css/plugins.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{url('assets/css/authentication/form-2.css')}}" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <link rel="stylesheet" type="text/css" href="{{url('assets/css/forms/theme-checkbox-radio.css')}}">
    <link rel="stylesheet" type="text/css" href="{{url('assets/css/forms/switches.css')}}">
</head>
<body class="form">
    
    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->

    <div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <h1 class="">Buat Akun</h1>
                        <p class="signup-link register">Sudah memiliki akun? <a href="{{url('user/login')}}">Masuk</a></p>
                        <form class="text-left" action="{{ url("user/register") }}" method="post">
                            <div class="form">

								<div id="email-field" class="field-wrapper input">
                                    <label for="email">EMAIL</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-at-sign register"><circle cx="12" cy="12" r="4"></circle><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path></svg>
                                    <input id="email" name="email" type="text" value="" class="form-control" placeholder="Email" required>
									<div class="invalid-feedback" style="display: block;">
										{% if messages['email'] is defined %}
											{{messages['email']}}
										{% endif %}
									</div>
								</div>

                                <div id="name-field" class="field-wrapper input">
                                    <label for="nama">NAMA</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                    <input id="nama" name="nama" type="text" class="form-control" placeholder="Nama" required>
									
								</div>
                                
                                <div id="password-field" class="field-wrapper input mb-2">
                                    <div class="d-flex justify-content-between">
                                        <label for="password">KATA SANDI</label>
                                    </div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    <input id="password" name="password" type="password" class="form-control" placeholder="Kata Sandi" required>
									<div class="invalid-feedback" style="display: block;">
										{% if messages['password'] is defined %}
											{{messages['password']}}
										{% endif %}
									</div>
								</div>

								 <div id="password-konfirmation-field" class="field-wrapper input mb-2">
                                    <div class="d-flex justify-content-between">
                                        <label for="konfirmasi_password">KONFIRMASI KATA SANDI</label>
                                    </div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    <input id="konfirmasi_password" name="konfirmasi_password" type="password" class="form-control" placeholder="Konfirmasi Kata Sandi" required>
									<div class="invalid-feedback" style="display: block;">
										{% if messages['konfirmasi_password'] is defined %}
											{{messages['konfirmasi_password']}}
										{% endif %}
									</div>
								</div>

                                <div class="d-sm-flex justify-content-between">
                                    <div class="field-wrapper">
                                        <button type="submit" class="btn btn-primary" value="">Buat Akun</button>
                                    </div>
                                </div>

                            </div>
                        </form>

                    </div>                    
                </div>
            </div>
        </div>
    </div>

    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="{{url('assets/js/libs/jquery-3.1.1.min.js')}}"></script>
    <script src="{{url('bootstrap/js/popper.min.js')}}"></script>
    <script src="{{url('bootstrap/js/bootstrap.min.js')}}"></script>
    
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="{{url('assets/js/authentication/form-2.js')}}"></script>
    <script>
        var loaderElement = document.querySelector('#load_screen');
        setTimeout( function() {
            loaderElement.style.display = "none";
        }, 3000);
    </script>
</body>
</html>