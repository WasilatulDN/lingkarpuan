<!DOCTYPE html>
<html>
<head>
	<title>Lingkar Puan</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdn.tiny.cloud/1/a9f7xblsuyi8v09v1a8lmet0us0guiplrzldj2xd6j1aff9l/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

<script>
  tinymce.init({
    selector: 'textarea#isi',
    menubar: false
  });
</script>
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
		Status: {{status.nama_status}} <br>
	  Catatan: <br>
	  - Catatan penilik: {{artikel.catatan_penilik}} <br>
	  - Catatan penulis: {{artikel.catatan_penulis}} <br><br>
	  <form action="{{ url("verifikasi/terima") }}" method="post" enctype="multipart/form-data">
	  	<input type="hidden" name="id_artikel" value="{{artikel.id_artikel}}">
	    <div class="form-group">
	      <label for="judul">Judul Artikel:</label>
	      <input type="text" class="form-control" id="judul" value="{{artikel.judul}}" name="judul">
	    </div>
	    <div class="form-group">
	      <label for="isi">Isi Artikel:</label>
	      <textarea id="isi" name="isi" class="form-control">{{artikel.isi_artikel}}</textarea>
	    </div>
	    <div class="form-group">
	      <label for="gambar">Gambar Ilustrasi:</label>
	      <input type="file" class="form-control" id="gambar" name="gambar" class="form-control" accept="image/jpg, image/jpeg, image/png">
	    </div>
	    <button type="submit" class="btn btn-default">Publikasikan</button>
	  </form>
	</div>
</body>
</html>