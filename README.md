# FastAPI + SQLModel + Alembic

A ready-to-deploy, async FastAPI project template with:

* ✅ SQLModel (ORM)
* ✅ Alembic (Database Migrations)
* ✅ PostgreSQL (Database)
* ✅ Docker (Containerization)
* ✅ Pytest (Testing Framework) - coming soon
* ✅ uv (Package Manager)
* 🚧 Github Actions (CI/CD)
* 🚧 AWS (Cloud Provider) - coming soon

Based on the [TestDriven.io](https://testdriven.io/) blog [post](https://testdriven.io/blog/fastapi-sqlmodel/) but updated and including more bells and whistles.

## Run

### With Docker

```bash
# start the containers
docker-compose up -d --build

# apply the migrations
docker-compose exec web alembic upgrade head

# cURL the api
curl http://localhost:8004/ping
{"ping": "pong!"}

# add a song
curl -d '{"name":"Thriller", "artist":"Michael Jackson", "year": "1984"}' -H "Content-Type: application/json" -X POST http://localhost:8004/songs

# get all songs
curl http://localhost:8004/songs

# stop the containers
docker-compose down -v
```

### Locally Without Docker

Dependencies:

* Python
* uv
* PostgreSQL

Setup:

```bash
# start the virtual environment
source .venv/bin/activate

# Copy the .env.example file to .env and update the values
cp example.env .env
# TODO: direnv or load_dotenv to automate setting env vars

# postgres setup (1 time only)
createdb -h localhost -p 5432 foo
psql -d foo
CREATE USER postgres WITH PASSWORD 'postgres';
ALTER USER postgres CREATEDB;
ALTER USER postgres WITH SUPERUSER;

# Run the migrations
alembic upgrade head

# Start the server
uvicorn app.main:app --reload --workers 1 --host 0.0.0.0 --port 8000
```

Repeat the cURLs above replacing port 8004 with 8000.
