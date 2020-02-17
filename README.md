# Simple news site
## Instalation
1. Clone repo
2. run `docker-compose up --build -d`
3. Site will be available on `http://localhost:8000/`
4. Make sure to create admin user with `docker exec -it back python manage.py createsuperuser`. After that, you can access admin panel on `http://localhost:8000/admin`
