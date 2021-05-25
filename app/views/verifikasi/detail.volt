{% extends "layouts/base.volt" %}

{% block custom_header %}{% endblock %}

{% block title %}{{artikel.judul}} - Verifikasi Artikel{% endblock %}

{% block content_title %}Verifikasi Artikel{% endblock %}

{% block content %}
	<div id="artikel_area" class="container layout-spacing">
		<div id="privacyWrapper" class="">
			<div class="privacy-container">
				<div class="privacyContent">
					<div class="privacy-content-container">
						{% if artikel.gambar is defined %}
							<img src="../../public/uploads/{{artikel.gambar}}" style="width: 500px">
						{% endif %}
						<div class="d-flex justify-content-between privacy-head">
							<div class="privacyHeader">
								<h1>{{artikel.judul}}</h1>
								<h5>
									<a href="../../profil/{{penulis.id_user}}" target="_blank">{{penulis.nama}}</a>
								</h5>
								<!-- <p>Sep 15, 2020</p> -->
							</div>
						</div>
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

		<div id="update_status">
			<a href="../terima/{{artikel.id_artikel}}" class="btn btn-success">Publikasikan</a>
			<a href="../tolak/{{artikel.id_artikel}}" class="btn btn-danger">Tolak</a>
			{% if(artikel.catatan_penilik == NULL) %}
				<a class="btn btn-info" id="button1">Tambahkan catatan revisi</a>
			{% endif %}
		</div>
		<div id="catatan_revisi" style="display: none">
			<form action="{{ url("verifikasi/catatan_penilik") }}" method="post">
				<input type="hidden" name="id_artikel" value="{{artikel.id_artikel}}">
				<div class="form-group" style="margin-top: 50px">
					<label for="catatan_penilik">Tambahkan catatan revisi:</label>
					<textarea id="catatan_penilik" name="catatan_penilik" class="form-control"></textarea>
				</div>
				<button type="submit" class="btn btn-success">Tambahkan</button>
				<a class="btn btn-danger" id="button2">Batal</a>
			</form>
		</div>
	</div>
{% endblock %}

{% block custom_script %}
<script>
	$(document).ready(function () {
		$("#button1").click(function () {
			$("#update_status").fadeOut();
			$("#catatan_revisi").fadeIn();
		});
		$("#button2").click(function () {
			$("#catatan_revisi").fadeOut();
			$("#update_status").fadeIn();
		});
	});
</script>
{% endblock %}
