{% extends "layouts/base.volt" %}

{% block custom_header %}
	<link href="{{url('assets/css/users/user-profile.css')}}" rel="stylesheet" type="text/css"/>
{% endblock %}

{% block title %}{{user.nama}} - Profil {% endblock %}

{% block content %}
	<div
		class="row layout-spacing">

		<!-- Content -->
		<div class="col-xl-4 col-lg-6 col-md-5 col-sm-12 layout-top-spacing">

			<div class="user-profile layout-spacing">
				<div class="widget-content widget-content-area">
					<div class="d-flex justify-content-between">
						<h3 class="">Profil</h3>
						<div class="mt-2 edit-profile"></div>
					</div>

					<div class="text-center user-info">
						<p class="">{{user.nama}}</p>
					</div>

					<div class="user-info-list">
						<div class="">
							<ul class="contacts-block list-unstyled">
								<li class="contacts-block__item">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" 
									fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" 
									stroke-linejoin="round" class="feather feather-briefcase">
									<rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect>
									<path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path>
									</svg>
									{{role.nama_role}}
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-8 col-lg-6 col-md-7 col-sm-12 layout-top-spacing">

			<div class="skills layout-spacing ">
				<div class="widget-content widget-content-area">
					<h3 class="">Artikel</h3>
					<ul>
						{% for artikel in artikels %}
							{% if artikel.id_status_artikel == 4 %}
								<li>
									<a href="{{url('artikel/detail/' ~ artikel.id_artikel)}}">{{artikel.judul}}</a>
								</li>
							{% endif %}
						{% endfor %}
					</ul>
				</div>
			</div>

			<div class="bio layout-spacing ">
				<div class="widget-content widget-content-area">
					<h3 class="">Jadwal</h3>
					<div class="table-responsive">
						<table class="table table-bordered mb-4">
							<thead>
								<tr>
									<th>Hari</th>
									<th>Jam Mulai</th>
									<th>Jam Selesai</th>
								</tr>
							</thead>
							<tbody>
							{% for jadwal in jadwals %}
								<tr>
									<td>{{jadwal['hari']}}</td>
									<td>{{jadwal['jam_mulai']}}</td>
									<td>{{jadwal['jam_selesai']}}</td>
								</tr>
							{% endfor %}
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>

	</div>
{% endblock %}
{% block custom_script %}{% endblock %}
