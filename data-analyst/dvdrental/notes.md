**Create and Run a PostgreSQL Docker Container**
- Pull the PostgreSQL image
    ```bash
    docker pull postgres:latest
    ```
- Run the PostgreSQL: 
    ```bash
    docker run --name dvdrental-db -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password -e POSTGRES_DB=dvdrental -p 5432:5432 -d postgres:latest
    ```
- Load the `dvdrental.tar` DB into the PostgreSQL
    `docker cp dvdrental.tar dvdrental-db:/tmp/dvdrental.tar`
- Access the PostgreSQL Container
    `docker exec -it dvdrental-db bash`
- Create the `postgres` Role (if needed)
    ```bash
    psql -U user -d dvdrental
    CREATE ROLE postgres WITH LOGIN SUPERUSER;
    \q
    ```
- Restore the Database:
    - Use the `pg_restore` command to load the `dvdrental.tar` file into the `dvdrental` database:
    `pg_restore -U user -d dvdrental /tmp/dvdrental.tar`
    - If you want to skip the role-related errors entirely, use the `--no-owner` flag:
    `pg_restore -U user --no-owner -d dvdrental /tmp/dvdrental.tar`
- Verify the Database
    ```bash
    psql -U user -d dvdrental
    \dt
    \q
    ```