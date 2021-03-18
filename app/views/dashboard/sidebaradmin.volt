<nav class="sidebar">
    <div class="side-header">
        <a href="{{ url('') }}">
            <img src="{{ url('img/cliniheal-wh.png') }}" style="width: 100%">
        </a>
    </div>
    <div class="side-menu">
        <ul>
            <li>
                <a href="{{ url('admin/home') }}">
                    <i class="fas fa-clipboard-list"> </i>
                    <span>Antrian</span>
                </a>
            </li>
            <li>
                <a href="{{ url() }}">
                    <i class="fas fa-users"> </i>
                    <span>Pasien</span>
                </a>
                <div class="side-submenu">
                    <ul>
                        <li>
                            <a href="{{ url('admin/daftar-pasien') }}">
                                <i class="fas fa-list-ul"></i>
                                <span>Daftar Pasien</span>
                            </a>
                        </li>
                        <li>
                            <a href="{{ url('admin/add-pasien') }}">
                                <i class="fas fa-user-plus"></i>
                                <span>Tambah Pasien</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            
        </ul>
    </div>
</nav>