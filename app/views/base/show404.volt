<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{{ url("img/favicon.ico") }}" type="image/x-icon"/>
    <link rel="shortcut icon" href="{{ url("img/favicon.ico") }}" type="image/x-icon"/>
    <title>404 - Cliniheal</title>
    <style>
        html, body {
            margin: 0px;
            font-family: 'Vibur', cursive;
            width: 100%;
            height: 100%;
        }

        body {
            position: relative;
        }

        .content {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .oopss {
            font-size: 100px;
        }

        .not-404 {
            float: right;
            font-size: 25px;
            font-family: "Segoe Script";
            margin: 10px 0px;
        }

        .btn-404 {
            background: dodgerblue;
            dispaly: inline-block;
            width: 100%;
            font-size: 16px;
            height: 50px;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 50px;
        }

        .warning-sym {
            text-align: center;
            font-size: 200px;
            color: #ed1c24;
        }
    </style>
    <script src="{{ url("js/fa.js") }}"></script>
</head>
<body>
<div class="content">
    <div class="warning-sym">
        <i class="fas fa-exclamation-triangle"></i>
    </div>
    <div class="oopss">
        Ooppsss...
    </div>
    <div class="not-404">
        404 - Halaman Tidak Ada!
    </div>
    <br><a href="{{ url("") }}">
        <button class="btn-404">Kembali ke halaman utama</button>
    </a>
</div>
</body>
</html>