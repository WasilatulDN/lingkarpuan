{% extends "layouts/base.volt" %}

{% block custom_header %}
    <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="{{url('plugins/table/datatable/datatables.css')}}">
    <link rel="stylesheet" type="text/css" href="{{url('assets/css/forms/theme-checkbox-radio.css')}}">
    <link rel="stylesheet" type="text/css" href="{{url('plugins/table/datatable/dt-global_style.css')}}">
    <link rel="stylesheet" type="text/css" href="{{url('plugins/table/datatable/custom_dt_custom.css')}}">
    <!-- END PAGE LEVEL CUSTOM STYLES -->
{% endblock %}

{% block title %}Jadwal Saya{% endblock %}

{% block content_title %}Jadwal Saya{% endblock %}

{% block content %}
<div class="col-lg-12">
    <a href={{url('jadwal/buat')}} class="btn btn-primary" style="margin-top: 20px; margin-bottom:20px">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus-circle"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>
        Tambahkan Jadwal
    </a>
    <div class="statbox widget box box-shadow" style="margin-bottom: 50 px">
        <div class="widget-content widget-content-area">
            <table id="style-2" class="table style-2  table-hover">
                <thead>
                    <tr>
                        <th>Hari</th>
                        <th>Jam Mulai</th>
                        <th>Jam Selesai</th>
                        <th>Aksi</th>
                    </tr>
                <thead>
                <tbody>
                    {% for jadwal in jadwals %}
                        <tr>
                            <td>{{jadwal['hari']}}</td>
                            <td>{{jadwal['jam_mulai']}}</td>
                            <td>{{jadwal['jam_selesai']}}</td>
                            <td><a href={{url('jadwal/hapus/' ~ jadwal['id_jadwal'])}} class="btn btn-danger">Hapus</a></td>
                        </tr>
                    {% endfor %}
                </tbody>
            </table>
        </div>
    </div>
</div>
{% endblock %}

{% block custom_script %}
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="{{url('plugins/table/datatable/datatables.js')}}"></script>
<script>
    // var e;
    c2 = $('#style-2').DataTable({    
        "dom": "<'dt--top-section'<'row'<'col-12 col-sm-6 d-flex justify-content-sm-start justify-content-center'l><'col-12 col-sm-6 d-flex justify-content-sm-end justify-content-center mt-sm-0 mt-3'f>>>" +
    "<'table-responsive'tr>" +
    "<'dt--bottom-section d-sm-flex justify-content-sm-between text-center'<'dt--pages-count  mb-sm-0 mb-3'i><'dt--pagination'p>>",
        "oLanguage": {
            "oPaginate": { "sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>' },
            "sInfo": "Menampilkan halaman _PAGE_ dari _PAGES_",
            "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
            "sSearchPlaceholder": "Cari...",
            "sLengthMenu": "Hasil :  _MENU_",
        },
        "lengthMenu": [5, 10, 20, 50],
        "pageLength": 5
    });

    multiCheck(c2);
</script>
<!-- END PAGE LEVEL SCRIPTS -->
{% endblock %}