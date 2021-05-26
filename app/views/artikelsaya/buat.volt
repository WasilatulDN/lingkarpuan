{% extends "layouts/base.volt" %}

{% block custom_header %}
	<script src="https://cdn.tiny.cloud/1/a9f7xblsuyi8v09v1a8lmet0us0guiplrzldj2xd6j1aff9l/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

	<script>
	tinymce.init({
		selector: 'textarea#isi',
		menubar: false
	});
	</script>
{% endblock %}

{% block title %}Buat Artikel{% endblock %}

{% block content_title %}Buat Artikel{% endblock %}

{% block content %}
<div>
    <blockquote class="blockquote">
        <p class="d-inline">Kirimkan artikel anda agar dapat dibaca oleh seluruh pengguna Lingkar Puan.
         Artikel yang anda kirim akan diverifikasi oleh tim penilik sebelum dipublikasikan. Tim penilik dapat melakukan revisi terhadap
         artikel anda dan anda dapat memberikan feedback terhadap revisi tersebut. Seluruh artikel yang anda
         kirim dapat dilihat pada halaman <b><a href="{{url('artikelsaya/')}}">Artikel Saya</a></b></p>
    </blockquote>
</div>
<form action="{{ url("artikelsaya/buat") }}" method="post">
    <div class="form-group">
        <label for="judul">Judul Artikel:</label>
        <input type="text" class="form-control" id="judul" placeholder="Masukkan judul artikel anda" name="judul" required>
    </div>
    <div class="form-group">
        <label for="isi">Isi Artikel:</label>
        <textarea id="isi" name="isi" class="form-control" rows="15"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Kirim Artikel</button>
</form>
{% endblock %}