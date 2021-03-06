{% extends "layouts/base.volt" %}

{% block custom_header %}{% endblock %}

{% block title %}{{artikel.judul}} - Publikasikan Artikel{% endblock %}

{% block content_title %}Publikasikan Artikel{% endblock %}

{% block content %}
	<div id="status_area" class="container layout-spacing">
		<div>
			Status :
			<span>
				<h5>{{status.nama_status}}</h5>
			</span>
		</div>
		{% if artikel.catatan_penulis is defined %}
			<div class="layout-spacing">
				Catatan Penulis :
				<blockquote class="blockquote">
					<p class="d-inline">{{artikel.catatan_penulis}}</p>
				</blockquote>
			</div>
		{% endif %}

		{% if artikel.catatan_penilik is defined %}
			<div class="layout-spacing">
				Catatan Penilik :
				<blockquote class="blockquote">
					<p class="d-inline">{{artikel.catatan_penilik}}</p>
				</blockquote>
			</div>
		{% endif %}

		<form action="{{ url("verifikasi/terima") }}" method="post" enctype="multipart/form-data">
			<input type="hidden" name="id_artikel" value="{{artikel.id_artikel}}">
			<div class="form-group">
				<label for="judul">Judul Artikel:</label>
				<input type="text" class="form-control" id="judul" value="{{artikel.judul}}" name="judul">
			</div>
			<div class="form-group">
				<label for="isi">Isi Artikel:</label>
				<textarea id="isi" name="isi" class="form-control" rows="15">{{artikel.isi_artikel}}</textarea>
			</div>
			<div class="form-group">
				<label for="gambar">Gambar Ilustrasi:</label>
				<input type="file" class="form-control" id="gambar" name="gambar" class="form-control" accept="image/jpg, image/jpeg, image/png" required>
			</div>
			<button type="submit" class="btn btn-success">Publikasikan</button>
		</form>
	</div>
{% endblock %}

{% block custom_script %}

	<script src="https://cdn.tiny.cloud/1/a9f7xblsuyi8v09v1a8lmet0us0guiplrzldj2xd6j1aff9l/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

	<script>
		tinymce.init({
			selector: 'textarea#isi',
			menubar: false,
			toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | outdent indent | image',
			plugins: 'image',
			/* enable title field in the Image dialog*/
			image_title: true,
			/* enable automatic uploads of images represented by blob or data URIs*/
			automatic_uploads: true,
			file_picker_types: 'image',
			/* and here's our custom image picker*/
			file_picker_callback: function (cb, value, meta) {
				var input = document.createElement('input');
				input.setAttribute('type', 'file');
				input.setAttribute('accept', 'image/*');

				/*
				Note: In modern browsers input[type="file"] is functional without
				even adding it to the DOM, but that might not be the case in some older
				or quirky browsers like IE, so you might want to add it to the DOM
				just in case, and visually hide it. And do not forget do remove it
				once you do not need it anymore.
				*/

				input.onchange = function () {
				var file = this.files[0];

				var reader = new FileReader();
				reader.onload = function () {
					/*
					Note: Now we need to register the blob in TinyMCEs image blob
					registry. In the next release this part hopefully won't be
					necessary, as we are looking to handle it internally.
					*/
					var id = 'blobid' + (new Date()).getTime();
					var blobCache =  tinymce.activeEditor.editorUpload.blobCache;
					var base64 = reader.result.split(',')[1];
					var blobInfo = blobCache.create(id, file, base64);
					blobCache.add(blobInfo);

					/* call the callback and populate the Title field with the file name */
					cb(blobInfo.blobUri(), { title: file.name });
				};
				reader.readAsDataURL(file);
				};

				input.click();
			},
		});
	</script>
{% endblock %}
