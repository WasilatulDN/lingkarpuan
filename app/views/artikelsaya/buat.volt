{% extends "layouts/base.volt" %}

{% block custom_header %}
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