@extends('layout')

@section('title', 'Categories')

@section('content')
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
@endsection