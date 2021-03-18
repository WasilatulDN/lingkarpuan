<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="{{ url("img/favicon.ico") }}" type="image/x-icon"/>
<link rel="shortcut icon" href="{{ url("img/favicon.ico") }}" type="image/x-icon"/>
<link href="{{ url("css/tabulator.min.css") }}" rel="stylesheet">
<link href="{{ url("css/bootstrap.min.css") }}" rel="stylesheet">
<link href="{{ url("css/style.css") }}" rel="stylesheet">
<script src="{{ url("js/tabulator.min.js") }}"></script>
{% if session.get('dokter') %}
    <link href="{{ url("css/dokter.css") }}" rel="stylesheet">
{% else %}
    <link href="{{ url("css/pasien.css") }}" rel="stylesheet">
{% endif %}