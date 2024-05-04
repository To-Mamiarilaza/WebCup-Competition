<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('categorie', function (Blueprint $table) {
            $table->timestamps();
        });
        Schema::table('etat_produit', function (Blueprint $table) {
            $table->timestamps();
        });
        Schema::table('condition_produit', function (Blueprint $table) {
            $table->timestamps();
        });
        Schema::table('produit', function (Blueprint $table) {
            $table->timestamps();
        });
        Schema::table('photo_produit', function (Blueprint $table) {
            $table->timestamps();
        });
        Schema::table('pays', function (Blueprint $table) {
            $table->timestamps();
        });
        Schema::table('ville', function (Blueprint $table) {
            $table->timestamps();
        });
        Schema::table('utilisateur_front_office', function (Blueprint $table) {
            $table->timestamps();
        });
           
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tables', function (Blueprint $table) {
            //
        });
    }
};
