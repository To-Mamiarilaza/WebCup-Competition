@extends('layout')

@section('title', 'Categories')

@section('content')
<div class="category-list">
    <h4>Liste des ventes a valider</h4>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Titre</th>
                <th>Prix</th>
                <th>Catégorie</th>
                <th>Utilisateur</th>
                <th>Ville</th>
                <th>Pays</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($produits as $produit)
            <tr>
                <td>{{ $produit->titre }}</td>
                <td>{{ $produit->prix }}</td>
                <td>{{ $produit->categorie }}</td>
                <td>{{ $produit->utilisateur }}</td>
                <td>{{ $produit->ville }}</td>
                <td>{{ $produit->pays }}</td>
                <td>
                    <a href="{{ route('produit.details', $produit->id) }}" class="btn btn-primary btn-sm"><i class="fas fa-info"></i></a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection