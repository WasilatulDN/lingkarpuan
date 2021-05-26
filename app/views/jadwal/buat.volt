{% extends "layouts/base.volt" %}

{% block title %}Buat Jadwal{% endblock %}

{% block custom_header %}
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" type="text/css" href="{{url('assets/css/elements/alert.css')}}">
    <style>
        .btn-light { border-color: transparent; }
    </style>
    <!--  END CUSTOM STYLE FILE  -->
{% endblock %}

{% block content_title %}Buat Jadwal{% endblock %}

{% block content %}
{% include 'layouts/alert.volt' %}
<form method="POST" action="{{ url('jadwal/buat') }}">
    <div class="form-group">
        <label for="hari">Hari</label>
        <select class="custom-select" id="hari" name="hari">
            <option value="Monday">Senin</option>
            <option value="Tuesday">Selasa</option>
            <option value="Wednesday">Rabu</option>
            <option value="Thursday">Kamis</option>
            <option value="Friday">Jumat</option>
            <option value="Satudray">Sabtu</option>
            <option value="Sunday">Minggu</option>
        </select>
    </div>
    <div class="form-group">
        <label for="jam_mulai">Jam Mulai</label>
        <input type="time" class="form-control" id="jam_mulai" name="jam_mulai" required>
    </div>
    <div class="form-group">
        <label for="jam_selesai">Jam Selesai</label>
        <input type="time" class="form-control" id="jam_selesai" name="jam_selesai" required>
    </div>
    <button type="submit" class="btn btn-primary">Tambahkan</button>
</form>
{% endblock %}