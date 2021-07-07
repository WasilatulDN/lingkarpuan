{% extends "layouts/base.volt" %}

{% block title %}Tambahkan Pengguna Baru{% endblock %}

{% block content_title %}Tambahkan Pengguna Baru{% endblock %}

{% block content %}

<form method="POST" action="{{ url('manajemenuser/postbuat') }}">
    <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
        <div class="invalid-feedback" style="display: block;">
            {% if messages['email'] is defined %}
                {{messages['email']}}
            {% endif %}
        </div>
    </div>
    <div class="form-group">
        <label for="nama">Nama</label>
        <input type="text" class="form-control" id="nama" name="nama" placeholder="Nama" required>
        <div class="invalid-feedback" style="display: block;">
            {% if messages['nama'] is defined %}
                {{messages['nama']}}
            {% endif %}
        </div>
    </div>
    <div class="form-group">
        <label for="role">Hak Akses</label>
        <select class="custom-select" id="role" name="role" required>
            <option value="" disabled selected> Silakan Pilih Hak Akses </option>
            {% for role in roles %}
                <option value={{ role.id_role }}>{{ role.nama_role }}</option>
            {% endfor %}
        </select>
    </div>
    <div class="form-group">
        <label for="password">Kata sandi</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Kata Sandi" required>
        <div class="invalid-feedback" style="display: block;">
            {% if messages['password'] is defined %}
                {{messages['password']}}
            {% endif %}
        </div>
    </div>
    <div class="form-group">
        <label for="konfirmasi_password">Konfirmasi kata sandi</label>
        <input type="password" class="form-control" id="konfirmasi_password" name="konfirmasi_password" placeholder="Konfirmasi Kata Sandi" required>
        <div class="invalid-feedback" style="display: block;">
            {% if messages['konfirmasi_password'] is defined %}
                {{messages['konfirmasi_password']}}
            {% endif %}
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Buat</button>
</form>
{% endblock %}