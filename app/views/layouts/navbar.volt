<nav class="nav">

    <div id="nav-btn" class="nav-btn">
        <i class="fas fa-bars fa-2x"></i>
    </div>
    <div class="dropdown-container">
        <div class="nav-dropdown">
            <div class="nav-dropdown-btn">
                <a href="user/login">
                    <i class="fas fa-user"></i>
                    Login
                </a>
            </div>
            
        </div>
        <div class="nav-dropdown">
            <div class="nav-dropdown-btn">
                <a href="user/register">
                    <i class="fas fa-user"></i>
                    Register
                </a>
            </div>
            
        </div>
    </div>
</nav>
<div class="side-menu">
    <ul>
        <li>
            <a href="{{ url() }}">
                <i class="fas fa-user-md"> </i>
                <span>Dokter</span>
            </a>
            <div class="side-submenu">
                <ul>
                    <li>
                        <a href="{{ url('dokter/login') }}">
                            <span>Masuk</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ url('dokter/register') }}">
                            <span>Daftar</span>
                        </a>
                    </li>
                </ul>
            </div>
        </li>
        <li>
            <a href="{{ url() }}">
                <i class="fas fa-user"> </i>
                <span>Pasien</span>
            </a>
            <div class="side-submenu">
                <ul>
                    <li>
                        <a href="{{ url('pasien/login') }}">
                            <span>Masuk</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{ url('pasien/register') }}">
                            <span>Daftar</span>
                        </a>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
</div>