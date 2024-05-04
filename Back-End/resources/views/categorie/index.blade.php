<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories</title>
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <style>
        .sidebar {
            height: 100%;
            width: 200px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #f8f9fa;
            padding-top: 20px;
        }

        .main-content {
            margin-left: 200px;
            padding: 20px;
        }

        /* Custom style for the form */
        .create-form {
            background-color: #ffffff;
            padding: 20px;
            margin-bottom: 20px;
        }

        /* Custom style for the list */
        .category-list {
            background-color: #ffffff;
            padding: 20px;
        }

        .button-wrapper {
            text-align: right;
            margin-top: 5px;
        }
    </style>
</head>

<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center mb-4">Fonctionnalites</h4>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="/categories">Categories</a>
            </li>
        </ul>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <div class="create-form">
            <h4>Creation de categorie</h4>
            <form method="POST" action="{{ url('/categories') }}" class="row">
                @csrf
                <div class="col-6">
                    <div class="form-group">
                        <label for="nom">Nom :</label>
                        <input type="text" class="form-control" id="nom" name="nom" required>
                    </div>
                </div>
                <div class="col-12">
                    <div class="row">
                        <div class="col-6">
                            <div class="button-wrapper">
                                <button type="submit" class="btn btn-primary">Valider</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="category-list">
            <h4>Liste des categories</h4>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($categories as $category)
                    <tr>
                        <td>{{ $category->nom }}</td>
                        <td>
                            <form method="POST" action="{{ route('categories.destroy', $category->id) }}" style="display: inline;">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm ml-2">Suprimer</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

    </div>

    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
</body>

</html>