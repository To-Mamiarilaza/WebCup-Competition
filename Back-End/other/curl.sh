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
  -H "Authorization: Bearer CPTATxtVQIzfrkvmAV0XID9pjmtm0ldFEC8qxbk1DQnDHgAQJF2vZLCbNzTu" \
  -d '{
    "mail": "logan@gmail.com",
    "password": "logan"
  }'
