<!DOCTYPE html>
<html>

<head>
    <title>Lingkar Puan</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container-fluid">
        <nav class="navbar navbar-default" style="background-color: #aacdbe">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Lingkar Puan</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Artikel
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="{{ url('artikel/') }}">Baca Artikel</a></li>
                            <li><a href="{{ url('artikelsaya/buat') }}">Kirim Artikel</a></li>
                            <li><a href="#">Artikel Saya</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Konsultasi
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Psikologi</a></li>
                            <li><a href="#">Hukum</a></li>
                        </ul>
                    </li>
                </ul>
                {% if(session.get('user')) %}
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="{{ url('user/logout') }}"><span class="glyphicon glyphicon-log-in"></span> Keluar</a>
                    </li>
                </ul>
                {% else %}
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="{{ url('user/register') }}"><span class="glyphicon glyphicon-user"></span> Buat
                            Akun</a></li>
                    <li><a href="{{ url('user/login') }}"><span class="glyphicon glyphicon-log-in"></span> Masuk</a>
                    </li>
                </ul>
                {% endif %}
            </div>
        </nav>
        <div class="container" style="padding: 4rem 0;">
            <div class="panel panel-default">
                <div class="panel-heading">Tambahkan Jadwal</div>
                <div class="panel-body">
                    <form method="POST" action="{{ url('jadwal/buat') }}">
                        <div class="form-check">
                            <label class="form-check-label" for="hari">Hari</label>
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
                            <input type="time" class="form-control" id="jam_mulai" name="jam_mulai">
                        </div>
                        <div class="form-group">
                            <label for="jam_selesai">Jam Selesai</label>
                            <input type="time" class="form-control" id="jam_selesai" name="jam_selesai">
                        </div>
                        <button type="submit" class="btn btn-primary">Tambahkan</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>