{% extends "layouts/base.volt" %}

{% block title %}Artikel{% endblock %}

{% block content_title %}Artikel{% endblock %}

{% block content %}
<div class="row">
	{% for artikel in artikels %}
		<div class="col-6 layout-spacing">
			<div class="card component-card_2">
				{% if artikel['gambar'] is defined %}
					<img src="{{url('uploads/' ~ artikel['gambar'])}}" class="card-img-top">
				{% endif %}
				<div class="card-body">
					<h5 class="card-title">{{artikel['judul']}}</h5>
					<p class="card-text">Oleh: {{artikel['nama_user']}} | {{artikel['tanggal']}}</p>
					<a href="detail/{{artikel['id_artikel']}}" class="btn btn-primary">Baca Artikel</a>
					<a href="../verifikasi/hapus/{{artikel['id_artikel']}}" class="btn btn-danger">Hapus Artikel</a>
				</div>
			</div>
		</div>
	{% endfor %}
</div>
{% endblock %}

{% block custom_script %}{% endblock %}
