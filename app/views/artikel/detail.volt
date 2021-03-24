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
	  <h5>Oleh: {{penulis.nama}}</h5>
	  {{artikel.isi_artikel}}
	  <h3>Komentar</h3>
	  <div>
	  	{% for komentar in data_komentar %}
	  		<div style="margin-bottom: 20px">
	  			dari: {{komentar['nama_user']}} <br>
	  			komentar: {{komentar['isi_komentar']}} <br>
	  			<a href="../hapuskomentar/{{komentar['id_komentar']}}" class="btn btn-default">Hapus Komentar</a>
	  		</div>
	  	{% endfor %}
	  </div>
	  <form action="{{ url("artikel/komentar") }}" method="post">
	  	<input type="hidden" name="id_artikel" value="{{artikel.id_artikel}}">
	    <div class="form-group" style="margin-top: 50px">
	      <label for="isi_komentar">Tulis Komentar:</label>
	      <textarea id="isi_komentar" name="isi_komentar" class="form-control"></textarea>
	    </div>
	    <button type="submit" class="btn btn-default">Kirim</button>
	  </form>
	</div>
</body>
</html>