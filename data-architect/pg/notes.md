## Setting up PostgreSQL with Docker
- Pull the PostgreSQL Docker image: `docker pull postgres`
- Run PostgreSQL Container:
    - `docker run --name postgres-container -e POSTGRES_USER=aduser -e POSTGRES_PASSWORD=adpassword -e POSTGRES_DB=addb -p 5432:5432 -d postgres`
- Access PostgreSQL directly: `docker exec -it postgres-container psql -U aduser -d addb`

## Setting up pgAdmin Container
- Pull the pgAdmin Docker image: `docker pull dpage/pgadmin4:latest`
- Run the pgAdmin Container:
    - `docker run --name pgadmin-container -e PGADMIN_DEFAULT_EMAIL=augustino0890@gmail.com -e PGADMIN_DEFAULT_PASSWORD=admin -p 80:80 -d dpage/pgadmin4:latest`
- Connect PostgreSQL container from pgAdmin:
    - Host name/address: `host.docker.internal` (if on Docker Desktop for Mac).
    - Port: `5432`
    - Maintenance database: `addb`
    - Username: `aduser`
    - Password: `adpassword`
If `host.docker.internal` doesn't work: `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' postgres-container` your_password