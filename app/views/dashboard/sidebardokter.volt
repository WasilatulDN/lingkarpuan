<nav class="sidebar">
    <div class="side-header">
        <a href="{{ url('') }}">
            <img src="{{ url('img/cliniheal-wh.png') }}" style="width: 100%">
        </a>
    </div>
    <div class="side-menu">
        <ul>
            <li>
                <a href="{{ url('dokter/home') }}">
                    <i class="fas fa-users"> </i>
                    <span>Pasien</span>
                </a>
            </li>
            <li>
                <a href="{{ url('dokter/rekam-medis') }}">
                    <i class="fas fa-clipboard-list"> </i>
                    <span>Rekam Medis</span>
                </a>
            </li>
            
        </ul>
    </div>
</nav>