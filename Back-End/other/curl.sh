# techmavericks_webcup
# --------------------------------------- LOGIN
curl http://127.0.0.1:8000/api/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "logan@gmail.com",
    "telephone": "0341122233",
    "avatar": "https://exemple.com/avatar.jpg",
    "name": "Lo",
    "password": "logan",
    "profile": 0
  }'


curl http://127.0.0.1:8000/api/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "logan@gmail.com",
    "password": "logan"
  }'

curl http://127.0.0.1:8000/api/test \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer 2FmaZ6hC8zmDnmnzGvqkHccIE9peTHD0rHNiEpWpdIohpzKcTiAmC80CN4MI"

# --------------------------------------------- GET
curl -X GET http://127.0.0.1:8000/api/mode_paiements \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer 2FmaZ6hC8zmDnmnzGvqkHccIE9peTHD0rHNiEpWpdIohpzKcTiAmC80CN4MI"

curl -X GET http://127.0.0.1:8000/api/equivalence_devises \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer 2FmaZ6hC8zmDnmnzGvqkHccIE9peTHD0rHNiEpWpdIohpzKcTiAmC80CN4MI"


# --------------------------------------------- AJOUT JETON
curl http://127.0.0.1:8000/api/transaction_jetons \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer 2FmaZ6hC8zmDnmnzGvqkHccIE9peTHD0rHNiEpWpdIohpzKcTiAmC80CN4MI" \
  -d '{
    "valeur_devise": 10,
    "montant": 1000
  }'


# --------------------------------------------- ACHAT PRODUIT
curl http://127.0.0.1:8000/api/achat_produits \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer 2FmaZ6hC8zmDnmnzGvqkHccIE9peTHD0rHNiEpWpdIohpzKcTiAmC80CN4MI" \
  -d '{
    "id_produit": 3,
  }'

# --------------------------------------------- ACHAT PRODUIT
curl http://127.0.0.1:8000/api/transactions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer 2FmaZ6hC8zmDnmnzGvqkHccIE9peTHD0rHNiEpWpdIohpzKcTiAmC80CN4MI" \
  -X POST
