<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/login.css') }}" rel="stylesheet">
</head>

<body>
    <div class="container centered-form">
        <div class="card p-4">

            @if($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif

            <form method="POST" action="{{ url('/login') }}">
                @csrf
                <div class="form-group">
                    <label for="nom">Nom d'utilisateur:</label>
                    <input type="text" class="form-control" id="nom" name="nom" value="techmavericks" required>
                </div>

                <div class="form-group">
                    <label for="mdp">Mot de passe:</label>
                    <input type="password" class="form-control" id="mdp" name="mdp" value="rollback001" required>
                </div>

                <div class="button-wrapper">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
        </div>
    </div>
    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
</body>

</html>
