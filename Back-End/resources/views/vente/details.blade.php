@extends('layout')

@section('title', 'Détails vente')

@section('content')
<div class="product-details">
    <div class="row">
        <div class="col-6">
            <h4>Détails de la vente</h4>
        </div>
        <div class="col-6 valider-button">
            <a href="{{ route('vente.valider', $produit->id) }}" class="btn btn-primary valider-button">Valider</a>
            <a href="{{ route('vente.refuser', $produit->id) }}" class="btn btn-warning valider-button">Refuser</a>
        </div>
    </div>
    <table class="table">
        <tbody>
            <tr>
                <th scope="row">Id:</th>
                <td>{{ $produit->id }}</td>
            </tr>
            <tr>
                <th scope="row">Titre:</th>
                <td>{{ $produit->titre }}</td>
            </tr>
            <tr>
                <th scope="row">Description:</th>
                <td>{{ $produit->description }}</td>
            </tr>
            <tr>
                <th scope="row">Prix:</th>
                <td>{{ $produit->prix }}</td>
            </tr>
            <tr>
                <th scope="row">État:</th>
                <td>{{ $produit->etat }}</td>
            </tr>
            <tr>
                <th scope="row">Catégorie:</th>
                <td>{{ $produit->categorie }}</td>
            </tr>
            <tr>
                <th scope="row">Utilisateur:</th>
                <td>{{ $produit->utilisateur }}</td>
            </tr>
            <tr>
                <th scope="row">Ville:</th>
                <td>{{ $produit->ville }}</td>
            </tr>
            <tr>
                <th scope="row">Pays:</th>
                <td>{{ $produit->pays }}</td>
            </tr>
            <tr>
                <th scope="row">Condition:</th>
                <td>{{ $produit->condition_ }}</td>
            </tr>
        </tbody>
    </table>

    @foreach ($produit->photos->chunk(3) as $chunk)
    <div class="row">
        @foreach ($chunk as $photo)
        <div class="col-md-4">
            <img class="product-image" src="{{ $photo->url }}" alt="Product Image">
        </div>
        @endforeach
    </div>
    @endforeach
</div>
@endsection