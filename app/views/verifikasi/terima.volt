{% extends "layouts/base.volt" %}

{% block custom_header %}{% endblock %}

{% block title %}{{artikel.judul}} - Publikasikan Artikel{% endblock %}

{% block content_title %}Publikasikan Artikel{% endblock %}

{% block content %}
	<div id="artikel_area" class="container layout-spacing">
		<div id="privacyWrapper" class="">
			<div class="privacy-container">
				<div class="privacyContent">
					<div class="d-flex justify-content-between privacy-head">
						<div class="privacyHeader">
							<h1>{{artikel.judul}}</h1>
							<!-- <p>Sep 15, 2020</p> -->
						</div>
					</div>

					<div class="privacy-content-container">
						<section>
							{{artikel.isi_artikel}}
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="status_area" class="container layout-spacing">
		<div>
			Status :
			<span>
				<h5>{{status.nama_status}}</h5>
			</span>
		</div>
		{% if artikel.catatan_penulis is defined %}
			<div class="layout-spacing">
				Catatan Penulis :
				<blockquote class="blockquote">
					<p class="d-inline">{{artikel.catatan_penulis}}</p>
				</blockquote>
			</div>
		{% endif %}

		{% if artikel.catatan_penilik is defined %}
			<div class="layout-spacing">
				Catatan Penilik :
				<blockquote class="blockquote">
					<p class="d-inline">{{artikel.catatan_penilik}}</p>
				</blockquote>
			</div>
		{% endif %}

		<form action="{{ url("verifikasi/terima") }}" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id_artikel" value="{{artikel.id_artikel}}">
			<div class="form-group">
				<label for="judul">Judul Artikel:</label>
				<input type="text" class="form-control" id="judul" value="{{artikel.judul}}" name="judul">
			</div>
			<div class="form-group">
				<label for="isi">Isi Artikel:</label>
				<textarea id="isi" name="isi" class="form-control" rows="15">{{artikel.isi_artikel}}</textarea>
			</div>
			<div class="form-group">
				<label for="gambar">Gambar Ilustrasi:</label>
				<input type="file" class="form-control" id="gambar" name="gambar" class="form-control" accept="image/jpg, image/jpeg, image/png" required>
			</div>
			<button type="submit" class="btn btn-success">Publikasikan</button>
		</form>
	</div>s
{% endblock %}

{% block custom_script %}

	<script src="https://cdn.tiny.cloud/1/a9f7xblsuyi8v09v1a8lmet0us0guiplrzldj2xd6j1aff9l/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

	<script>
		tinymce.init({selector: 'textarea#isi', menubar: false});
	</script>
{% endblock %}
