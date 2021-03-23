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
		      <a class="navbar-brand" href="#">Kirim Artikel</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Artikel
		        <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="#">Baca Artikel</a></li>
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
	  <h2>Kirim Artikel Anda</h2>
	  <form action="{{ url("artikelsaya/buat") }}" method="post">
	    <div class="form-group">
	      <label for="judul">Judul Artikel:</label>
	      <input type="text" class="form-control" id="judul" placeholder="Masukkan judul artikel anda" name="judul">
	    </div>
	    <div class="form-group">
	      <label for="isi">Isi Artikel:</label>
	      <textarea id="isi" name="isi" class="form-control"></textarea>
	    </div>
	    <button type="submit" class="btn btn-default">Kirim Artikel</button>
	  </form>
	</div>
</body>
</html>