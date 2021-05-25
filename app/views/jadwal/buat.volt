{% extends "layouts/base.volt" %}

{% block title %}Buat Jadwal{% endblock %}

{% block content_title %}Buat Jadwal{% endblock %}

{% block content %}
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