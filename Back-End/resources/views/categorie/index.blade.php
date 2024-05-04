@extends('layout')

@section('title', 'Categories')

@section('content')
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
                        <button type="submit" class="btn btn-primary"><i class="fas fa-check"></i> Creer</button>
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
                    <a href="{{ route('categories.edit', $category->id) }}" class="btn btn-primary btn-sm ml-2"><i class="fas fa-edit"></i></a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection