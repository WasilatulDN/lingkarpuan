{% extends "layouts/base.volt" %}

{% block title %}{{artikel.judul}} - Artikel Saya{% endblock %}

{% block content_title %}Artikel Saya{% endblock %}

{% block content %}
	<div id="artikel_area" class="container layout-spacing">
		<div id="privacyWrapper" class="">
			<div class="privacy-container">
				<div class="privacyContent">
					<div class="privacy-content-container">
						{% if artikel.gambar is defined %}
							<img src="../../public/uploads/{{artikel.gambar}}" style="width: 100%">
						{% endif %}
						<div class="d-flex justify-content-between privacy-head">
							<div class="privacyHeader">
								<h1>{{artikel.judul}}</h1>
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

		{% if artikel.catatan_penilik is defined %}
			<div class="layout-spacing">
				Catatan Penilik :
				<blockquote class="blockquote">
					<p class="d-inline">{{artikel.catatan_penilik}}</p>
				</blockquote>
			</div>
		{% endif %}

		{% if artikel.catatan_penulis is defined %}
			<div class="layout-spacing">
				Catatan Penulis :
				<blockquote class="blockquote">
					<p class="d-inline">{{artikel.catatan_penulis}}</p>
				</blockquote>
			</div>
		{% endif %}

		{% if(artikel.id_status_artikel == 2) %}
			<div id="revisi">
				<a href="../konfirmasi/{{artikel.id_artikel}}" class="btn btn-success">Konfirmasi Revisi</a>
				<a class="btn btn-info" id="button1">Tambahkan catatan untuk tim penilik</a>
			</div>
			<div id="catatan_revisi" style="display: none">
				<form action="{{ url("artikelsaya/catatan_penulis") }}" method="post">
					<input type="hidden" name="id_artikel" value="{{artikel.id_artikel}}">
					<div class="form-group" style="margin-top: 50px">
						<label for="catatan_penulis">Tambahkan catatan:</label>
						<textarea id="catatan_penulis" name="catatan_penulis" class="form-control"></textarea>
					</div>
					<button type="submit" class="btn btn-success">Tambahkan catatan dan konfirmasi</button>
					<a class="btn btn-danger" id="button2">Batal</a>
				</form>
			</div>
		</div>
	{% endif %}
{% endblock %}

{% block custom_script %}
<script>
$(document).ready(function () {
	$("#button1").click(function () {
		$("#revisi").fadeOut();
		$("#catatan_revisi").fadeIn();
	});
	$("#button2").click(function () {
		$("#catatan_revisi").fadeOut();
		$("#revisi").fadeIn();
	});
});
</script>
{% endblock %}
