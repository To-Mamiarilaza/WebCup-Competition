<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class CheckUserToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */

     public function handle(Request $request, Closure $next)
     {
         $token = $request->header('ApiToken');
         Log::info($request->header);
        //  $token = str_replace('Bearer ', '', $token);

         $tokenData = DB::table('tokens')->where('token', $token)->first();

         if (!$tokenData) {
            Log::info('nullos be '.$token.' vide');
             return response()->json(['error' => 'Token invalide'], 401);
         }

         $utilisateurFrontOffice = DB::table('utilisateur_front_office')->where('id', $tokenData->id_user)->first();
         $request->merge([
            'id_user' => $utilisateurFrontOffice->id,
            'name' => $utilisateurFrontOffice->name,
            'profile' => $utilisateurFrontOffice->profile,
        ]);

        //  Log::info('DATA : '. $utilisateurFrontOffice->id);

         return $next($request);
     }
}
