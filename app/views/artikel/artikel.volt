<!DOCTYPE html>
<html>
<head>
	<title>Lingkar Puan</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<nav class="navbar navbar-default" style="background-color: #aacdbe">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="#">Lingkar Puan</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Artikel
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="{{ url('artikel/') }}">Baca Artikel</a></li>
		          <li><a href="{{ url('artikelsaya/buat') }}">Kirim Artikel</a></li>
		          <li><a href="#">Artikel Saya</a></li>
		        </ul>
		      </li>
		      <li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Konsultasi
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="#">Psikologi</a></li>
		          <li><a href="#">Hukum</a></li>
		        </ul>
		      </li>
		    </ul>
		    {% if(session.get('user')) %}
		    	<ul class="nav navbar-nav navbar-right">
			      <li><a href="{{ url('user/logout') }}"><span class="glyphicon glyphicon-log-in"></span> Keluar</a></li>
			    </ul>
		    {% else %}
			    <ul class="nav navbar-nav navbar-right">
			      <li><a href="{{ url('user/register') }}"><span class="glyphicon glyphicon-user"></span> Buat Akun</a></li>
			      <li><a href="{{ url('user/login') }}"><span class="glyphicon glyphicon-log-in"></span> Masuk</a></li>
			    </ul>
		    {% endif %}
		  </div>
		</nav>
	  <h2>Artikel di Lingkar Puan</h2>
	  <div class="panel-group">
	  	{% for artikel in artikels %}
	  		<div class="col-md-6">
		  		<div class="panel panel-default" style="margin: 10px">
			      <div class="panel-heading">{{artikel.judul}}</div>
			      <div class="panel-body">
			      	<a href="detail/{{artikel.id_artikel}}" class="btn btn-primary">Baca Artikel</a>
			      	<a href="../verifikasi/hapus/{{artikel.id_artikel}}" class="btn btn-danger">Hapus Artikel</a>
			      </div>
			    </div>
		  	</div>
	  	{% endfor %}
	  	<!-- <div class="col-md-6">
	  		<div class="panel panel-default" style="margin: 10px">
		      <div class="panel-heading">Panel with panel-default class</div>
		      <div class="panel-body">Panel Content</div>
		    </div>
	  	</div>
	  	<div class="col-md-6">
	  		<div class="panel panel-default" style="margin: 10px">
		      <div class="panel-heading">Panel with panel-default class</div>
		      <div class="panel-body">Panel Content</div>
		    </div>
	  	</div>
	  	<div class="col-md-6">
	  		<div class="panel panel-default" style="margin: 10px">
		      <div class="panel-heading">Panel with panel-default class</div>
		      <div class="panel-body">Panel Content</div>
		    </div>
	  	</div> -->
	  </div>
	  
	</div>
</body>
</html>