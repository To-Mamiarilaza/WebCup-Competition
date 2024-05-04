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
            <h4>Modification de categorie</h4>
            <form method="POST" action="{{ route('categories.update', ['category' => $category->id]) }}" class="row">
                @csrf
                @method('POST') <!-- Use PUT method for updating -->
                <div class="col-6">
                    <div class="form-group">
                        <label for="nom">Nom :</label>
                        <input type="text" class="form-control" id="nom" name="nom" value="{{ $category->nom }}" required>
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
    </div>


    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>
</body>

</html>