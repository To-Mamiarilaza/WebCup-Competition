<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/common.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center mb-4">BACK-OFFICE</h4>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link {{ Request::is('categories') ? 'active' : '' }}" href="{{ route('categorie.index') }}">
                    <i class="fas fa-list"></i> Categories
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link {{ Request::is('nouvelle_ventes') ? 'active' : '' }}" href="{{ route('nouvelle_ventes') }}">
                    <i class="fas fa-shopping-bag"></i> Ventes
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('logout') }}">
                    <i class="fas fa-sign-out-alt"></i> Se déconnecter
                </a>
            </li>


            <!-- Add more links as needed -->
        </ul>
    </div>

    <!-- Main content -->
    <div class="main-content">
        @yield('content')
    </div>

    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
</body>

</html>