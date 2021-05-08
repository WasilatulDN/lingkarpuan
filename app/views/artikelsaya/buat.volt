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
<form action="{{ url("artikelsaya/buat") }}" method="post">
    <div class="form-group">
        <label for="judul">Judul Artikel:</label>
        <input type="text" class="form-control" id="judul" placeholder="Masukkan judul artikel anda" name="judul">
    </div>
    <div class="form-group">
        <label for="isi">Isi Artikel:</label>
        <textarea id="isi" name="isi" class="form-control" rows="15"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Kirim Artikel</button>
</form>
{% endblock %}