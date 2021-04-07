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
	  <h2>{{artikel.judul}}</h2>
	  {{artikel.isi_artikel}}
	  <br>
	  Status: {{status.nama_status}} <br>
	  Catatan: <br>
	  - Catatan penilik: {{artikel.catatan_penilik}} <br>
	  - Catatan penulis: {{artikel.catatan_penulis}} <br>
	  {% if(artikel.id_status_artikel == 2) %}
		  <div id="elemen1">
	      <a href="../konfirmasi/{{artikel.id_artikel}}" class="btn btn-success">Konfirmasi Revisi</a>
	      <a class="btn btn-info" id="button1">Tambahkan catatan untuk tim penilik</a></li>
	    </div>  
	    <div id="elemen2" style="display: none">
	      <form action="{{ url("artikelsaya/catatan_penulis") }}" method="post">
	        <input type="hidden" name="id_artikel" value="{{artikel.id_artikel}}">
	        <div class="form-group" style="margin-top: 50px">
	          <label for="catatan_penulis">Tambahkan catatan:</label>
	          <textarea id="catatan_penulis" name="catatan_penulis" class="form-control"></textarea>
	        </div>
	        <button type="submit" class="btn btn-success">Tambahkan catatan dan konfirmasi</button>
	      </form>
	      <a class="btn btn-danger" id="button2">Batal</a></li>
	    </div>
	  {% endif %}
    
	</div>
  <script>
    $(document).ready(function(){
      $("#button1").click(function(){
        $("#elemen1").fadeOut();
        $("#elemen2").fadeIn();
      });
      $("#button2").click(function(){
        $("#elemen2").fadeOut();
        $("#elemen1").fadeIn();
      });
    });
  </script>
</body>
</html>