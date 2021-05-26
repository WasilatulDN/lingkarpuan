{% extends "layouts/base.volt" %}

{% block custom_header %}
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="{{url('assets/css/apps/notes.css')}}" rel="stylesheet" type="text/css"/>
	<link href="{{url('assets/css/forms/theme-checkbox-radio.css')}}" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="{{url('plugins/table/datatable/datatables.css')}}">
	<link rel="stylesheet" type="text/css" href="{{url('plugins/table/datatable/dt-global_style.css')}}">
	<link rel="stylesheet" type="text/css" href="{{url('plugins/table/datatable/custom_dt_custom.css')}}">
	<link rel="stylesheet" type="text/css" href="{{url('assets/css/elements/alert.css')}}">
    <style>
        .btn-light { border-color: transparent; }
    </style>
<!-- END PAGE LEVEL STYLES -->
{% endblock %}
{% block title %}Verifikasi Artikel{% endblock %}

{% block content_title %}Verifikasi Artikel{% endblock %}

{% block content %}
	{% include 'layouts/alert.volt' %}
	<div class="row app-notes layout-top-spacing" id="cancel-row">
		<div class="col-lg-12">
			<div class="app-hamburger-container">
				<div class="hamburger">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu chat-menu d-xl-none">
						<line x1="3" y1="12" x2="21" y2="12"></line>
						<line x1="3" y1="6" x2="21" y2="6"></line>
						<line x1="3" y1="18" x2="21" y2="18"></line>
					</svg>
				</div>
			</div>

			<div class="app-container">
				<div class="app-note-container">
					<div class="app-note-overlay"></div>
					<div class="tab-title">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-12 mt-5">
								<ul class="nav nav-pills d-block" id="pills-tab3" role="tablist">
									<li class="nav-item">
										<a class="nav-link list-actions active" id="verifikasi">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2">
												<path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path>
											</svg>
											Verifikasi Artikel</a>
									</li>
									<li class="nav-item">
										<a class="nav-link list-actions" id="konfirmasi">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check">
												<polyline points="20 6 9 17 4 12"></polyline>
											</svg>
											Konfirmasi Penulis</a>
									</li>
								</ul>
								<hr>
							</div>
						</div>
					</div>


					<div id="ct" class="note-container note-grid">
						<div style="width: 100%" class="verifikasi">
							<table id="style-2" class="table style-2 table-hover">
								<thead>
									<tr>
										<th>Judul</th>
										<th>Status</th>
										<th>Aksi</th>
									</tr>
								</thead>
								<tbody>
									{% for verifikasi in data_verifikasi %}
										<tr>
											<td>{{verifikasi['judul']}}</td>
											<td>{{verifikasi['status']}}</td>
											<td>
												<a href="{{url('verifikasi/detail/' ~ verifikasi['id_artikel'])}}" class="btn btn-primary">Detail Artikel</a>
											</td>
										</tr>
									{% endfor %}
								</tbody>
							</table>
						</div>

						<div style="width: 100%; display: none;" class="konfirmasi">
							<table id="style-1" class="table style-2 table-hover">
								<thead>
									<tr>
										<th>Judul</th>
										<th>Status</th>
										<th>Aksi</th>
									</tr>
								</thead>
								<tbody>
									{% for konfirmasi in data_konfirmasi %}
										<tr>
											<td>{{konfirmasi['judul']}}</td>
											<td>{{konfirmasi['status']}}</td>
											<td>
												<a href="{{url('verifikasi/detail/' ~ konfirmasi['id_artikel'])}}" class="btn btn-primary">Detail Artikel</a>
											</td>
										</tr>
									{% endfor %}
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
{% endblock %}

{% block custom_script %}
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="{{url('assets/js/ie11fix/fn.fix-padStart.js')}}"></script>
	<script src="{{url('assets/js/apps/customlist.js')}}"></script>
	<script src="{{url('plugins/table/datatable/datatables.js')}}"></script>
	<script>
		// var e;
		c2 = $('#style-2').DataTable({
		"order": [],
        "columnDefs": [ {
            "targets"  : 'no-sort',
            "orderable": false,
        }],
		"dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" + "<'table-responsive'tr>" + "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
		"oLanguage": {
		"oPaginate": {
		"sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>',
		"sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>'
		},
		"sInfo": "Menampilkan halaman _PAGE_ dari _PAGES_",
		"sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
		"sSearchPlaceholder": "Cari...",
		"sLengthMenu": "Hasil :  _MENU_"
		},
		"lengthMenu": [
		5, 10, 20, 50
		],
		"pageLength": 5
		});

		multiCheck(c2);

		c1 = $('#style-1').DataTable({
		"order": [],
        "columnDefs": [ {
            "targets"  : 'no-sort',
            "orderable": false,
        }],
		"dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" + "<'table-responsive'tr>" + "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
		"oLanguage": {
		"oPaginate": {
		"sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>',
		"sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>'
		},
		"sInfo": "Menampilkan halaman _PAGE_ dari _PAGES_",
		"sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
		"sSearchPlaceholder": "Cari...",
		"sLengthMenu": "Hasil :  _MENU_"
		},
		"lengthMenu": [
		5, 10, 20, 50
		],
		"pageLength": 5
		});

		multiCheck(c1);
	</script>
	<!-- END PAGE LEVEL SCRIPTS -->
{% endblock %}
