{% extends "layouts/base.volt" %}

{% block title %}{{artikel.judul}}{% endblock %}

{% block content %}
	<div id="artikel_area" class="container layout-spacing">
		<div id="privacyWrapper" class="">
			<div class="privacy-container">
				<div class="privacyContent">
					{% if (session.get('user')['role'] == 4) %}
						<a href="{{url('verifikasi/hapus/' ~ artikel.id_artikel)}}" class="btn btn-danger" style="margin-bottom: 20px">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2">
								<polyline points="3 6 5 6 21 6"></polyline>
								<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
								<line x1="10" y1="11" x2="10" y2="17"></line>
								<line x1="14" y1="11" x2="14" y2="17"></line>
							</svg>
							Hapus Artikel
						</a>
					{% endif %}
					<div class="privacy-content-container">
						{% if artikel.gambar is defined %}
							<img src="{{url('uploads/' ~ artikel.gambar)}}" style="width: 100%">
						{% endif %}
						<div class="d-flex justify-content-between privacy-head">
							<div class="privacyHeader">
								<h1>{{artikel.judul}}</h1>
								<p>Oleh: 
									{% if (penulis.id_role == 1) %}
										<b>{{penulis.nama}}</b>
									{% else %}
										<b><a href="{{url('profil/detail/' ~ penulis.id_user)}}" target="_blank">{{penulis.nama}}</a></b>
									{% endif %}
									| {{artikel.updated_at}}
								</p>
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
	<div id="komentar_semua" class="container layout-spacing">
		<h4 style="font-weight: bold;"> Komentar </h4>
		{% for komentar in data_komentar %}
			<div class="card-body">
				<div class="row">
					<div class="col-10">
						<h5 class="card-title">
							{% if (komentar['role_user'] == 1) %}
								{{komentar['nama_user']}}
							{% else %}
								<a href="{{url('profil/detail/' ~ komentar['id_user'])}}" target="_blank">{{komentar['nama_user']}}</a>
							{% endif %}
						</h5>
						<p class="card-text">{{komentar['isi_komentar']}}</p>
					</div>
					{% if (session.get('user')['id'] == komentar['id_user'] OR session.get('user')['role'] == 4) %}
						<div class="col-2">
							<a class="btn btn-danger" href="{{url('artikel/hapuskomentar/' ~ komentar['id_komentar'])}}">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2">
									<polyline points="3 6 5 6 21 6"></polyline>
									<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
									<line x1="10" y1="11" x2="10" y2="17"></line>
									<line x1="14" y1="11" x2="14" y2="17"></line>
								</svg>
							</a>
						</div>						
					{% endif %}

				</div>
			</div>
			<hr style="height: 1px; border: none; background-color: #7B7B7B">
		{% endfor %}
	</div>
	{% if (session.get('user')['role'] != 4) %}
		<div id="komentar_area" class="container layout-spacing">
			<form action="{{ url("artikel/komentar") }}" method="post">
				<input type="hidden" name="id_artikel" value="{{artikel.id_artikel}}">
				<div class="form-group mb-4">
					<label for="Komentar">Komentar Anda</label>
					<textarea class="form-control" id="isi_komentar" name="isi_komentar" rows="3"></textarea>
				</div>
				<div class="form-group mb-4">
					<button class="btn btn-primary" type='submit'>Kirim</button>
				</div>
			</form>
		</div>
    {% endif %}

{% endblock %}

{% block custom_script %}{% endblock %}
