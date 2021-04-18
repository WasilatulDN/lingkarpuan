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
                <div class="panel-heading">Ajukan Konsultasi Hukum</div>
                <div class="panel-body">
                    <form method="POST" action="{{ url('konsultasi/hukum') }}">
                        <div class="form-group">
                            <label for="tanggal">Tanggal</label>
                            <input type="date" class="form-control" id="tanggal" name="tanggal">
                            {% if(messages['tanggal'] is defined) %}
                                <p class="block-content nice-copy">{{messages['tanggal']}}</p>
                            {% endif %}
                        </div>
                        <div class="form-group">
                            <label for="jam">Jam</label>
                            <input type="time" class="form-control" id="jam" name="jam">
                            {% if(messages['jam'] is defined) %}
                                <p class="block-content nice-copy">{{messages['jam']}}</p>
                            {% endif %}
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="durasi">Durasi</label>
                            <select class="custom-select" id="durasi" name="durasi">
                                <option value="20">20 Menit</option>
                                <option value="40">40 Menit</option>
                                <option value="60">60 Menit</option>
                            </select>
                        </div>
                        <div class="form-check">
                            <label class="form-check-label" for="hukum">Rekan Hukum</label>
                            <select class="custom-select" id="hukum" name="hukum">
                              {% for hukum in hukums %}
                                  <option value={{ hukum.id_user }}>{{ hukum.nama }}</option>
                              {% endfor %}
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>