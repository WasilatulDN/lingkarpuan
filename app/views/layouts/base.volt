<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{{ url("img/favicon.ico") }}" type="image/x-icon"/>
    <link rel="shortcut icon" href="{{ url("img/favicon.ico") }}" type="image/x-icon"/>
    {% include 'layouts/header.volt' %}
    <title>{% block title %}{% endblock %} - Cliniheal</title>
</head>
<body>
{% block content %}{% endblock %}
</body>
</html>