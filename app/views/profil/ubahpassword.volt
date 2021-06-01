{% extends "layouts/base.volt" %}

{% block custom_header %}
    <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
    <link rel="stylesheet" type="text/css" href="{{url('assets/css/elements/alert.css')}}">
    <style>
        .btn-light { border-color: transparent; }
    </style>
    <!-- END PAGE LEVEL CUSTOM STYLES -->
{% endblock %}

{% block title %}Ubah Kata Sandi{% endblock %}

{% block content_title %}Ubah Kata Sandi{% endblock %}

{% block content %}
{% include 'layouts/alert.volt' %}
<form method="POST" action="{{ url('profil/ubahpassword') }}">
    <input type="hidden" name="id_user" value="{{session.get('user')['id']}}">
    <div class="form-group">
        <label for="password_lama">Kata Sandi Lama</label>
        <input type="password" class="form-control" id="password_lama" name="password_lama" placeholder="Kata Sandi Lama" required>
        <div class="invalid-feedback" style="display: block;">
            {% if messages['password_lama'] is defined %}
                {{messages['password_lama']}}
            {% endif %}
        </div>
    </div>
    <div class="form-group">
        <label for="password_baru">Kata Sandi Baru</label>
        <input type="password" class="form-control" id="password_baru" name="password_baru" placeholder="Kata Sandi Baru" required>
        <div class="invalid-feedback" style="display: block;">
            {% if messages['password_baru'] is defined %}
                {{messages['password_baru']}}
            {% endif %}
        </div>
    </div>
    <div class="form-group">
        <label for="konfirmasi_password_baru">Konfirmasi Kata Sandi Baru</label>
        <input type="password" class="form-control" id="konfirmasi_password_baru" name="konfirmasi_password_baru" placeholder="Konfirmasi Kata Sandi Baru" required>
        <div class="invalid-feedback" style="display: block;">
            {% if messages['konfirmasi_password_baru'] is defined %}
                {{messages['konfirmasi_password_baru']}}
            {% endif %}
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Ubah Kata Sandi</button>
</form>
{% endblock %}