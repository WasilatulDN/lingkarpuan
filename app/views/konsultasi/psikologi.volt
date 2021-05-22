{% extends "layouts/base.volt" %}

{% block title %}Ajukan Konsultasi Psikologi{% endblock %}

{% block content_title %}Ajukan Konsultasi Psikologi{% endblock %}

{% block content %}
<form method="POST" action="{{ url('konsultasi/psikologi') }}">
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
            <option value="60">60 Menit</option>
        </select>
    </div>
    <div class="form-group">
        <label for="psikolog">Psikolog</label>
        <select class="custom-select" id="psikolog" name="psikolog">
            {% for psikolog in psikologs %}
                <option value={{ psikolog.id_user }}>{{ psikolog.nama }}</option>
            {% endfor %}
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>
{% endblock %}