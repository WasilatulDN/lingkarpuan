{% extends "layouts/base.volt" %}

{% block title %}Ajukan Konsultasi Psikologi{% endblock %}

{% block custom_header %}
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link rel="stylesheet" type="text/css" href="{{url('assets/css/elements/alert.css')}}">
    <link href="https://unpkg.com/vis-timeline@latest/styles/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />
    <style>
        .btn-light { border-color: transparent; }
    </style>
    <!--  END CUSTOM STYLE FILE  -->
{% endblock %}

{% block content_title %}Ajukan Konsultasi Psikologi{% endblock %}

{% block content %}
{% include 'layouts/alert.volt' %}
<div>
    <blockquote class="blockquote">
        <p class="d-inline">Konsultasi psikologi adalah sesi dimana kamu dapat berkomunikasi dengan
        rekan cerita pilihan lingkar puan. Rekan cerita adalah orang-orang dengan latar belakang
        ilmu psikologi yang dapat membantumu menghadapi trauma akibat kekerasan terhadap perempuan
        yang kamu alami.</p>
    </blockquote>
</div>
<form method="POST" action="{{ url('konsultasi/psikologi') }}">
    <div class="form-group">
        <label for="psikolog">Rekan Cerita</label>
        <select class="custom-select" id="psikolog" name="psikolog" required>
            <option value="" disabled selected> Silakan Pilih Rekan Cerita </option>
            {% for psikolog in psikologs %}
                <option value={{ psikolog.id_user }}>{{ psikolog.nama }}</option>
            {% endfor %}
        </select>
        <div id="show_profile" style="float: right; margin-top: 10px">
            
        </div> 
    </div>
    <div class="form-group">
        <label for="jadwal">Jadwal</label>
        <div id="jadwal">
            <ul id="jadwal_list">
                <li>Silakan Pilih Rekan Cerita</li>
            </ul>
        </div>
        <div id="visualization"></div>
    </div>
    <div class="form-group">
        <label for="tanggal">Tanggal</label>
        <input type="date" class="form-control" id="tanggal" name="tanggal" required>
        <div class="invalid-feedback" style="display: block;">
            {% if messages['tanggal'] is defined %}
                {{messages['tanggal']}}
            {% endif %}
        </div>
    </div>
    <div class="form-group">
        <label for="jam">Jam</label>
        <input type="time" class="form-control" id="jam" name="jam" required>
        <div class="invalid-feedback" style="display: block;">
            {% if messages['jam'] is defined %}
                {{messages['jam']}}
            {% endif %}
        </div>
    </div>
    <div class="form-group">
        <label for="durasi">Durasi</label>
        <select class="custom-select" id="durasi" name="durasi">
            <option value="20">20 Menit</option>
            <option value="40">40 Menit</option>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Ajukan</button>
</form>
{% endblock %}

{% block custom_script %}

<script type="text/javascript" src="https://unpkg.com/vis-timeline@latest/standalone/umd/vis-timeline-graph2d.min.js"></script>
<script>   

    var container = document.getElementById('visualization');
    var items = new vis.DataSet();
    var options = {};
    var timeline = new vis.Timeline(container, items, options);

    $('#psikolog').change(function (e) {
        id = e.target.value;
        $.get(`{{url('konsultasi/jadwal/')}}/${id}`, function (data) {
            document.getElementById('jadwal_list').innerHTML = '';
            var innerHTML = ''
            if(data.jadwal_datas.length == 0) {
                innerHTML = `<li>Rekan Cerita tidak memiliki jadwal</li>`;
            } else {
                data.jadwal_datas.forEach(element => {
                    innerHTML += `<li>${element.hari} - ${element.jam_mulai} - ${element.jam_selesai}</li>`
                });
            }
            document.getElementById('jadwal_list').innerHTML = innerHTML;
            timeline.itemsData.clear()
            timeline.itemsData.add(data.konsultasi_datas)
            timeline.redraw()
            if (data.konsultasi_datas[0]) {
                timeline.moveTo(data.konsultasi_datas[0].start)
            }
        })

        document.getElementById('show_profile').innerHTML = `<a href="{{url('profil/detail/${id}')}}" class="btn btn-primary btn-sm" target="_blank">Lihat Profil</a>`;

    })
</script>

{% endblock %}