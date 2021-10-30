# Postgres

Docker PostgreSQL + PostGIS [v12/13/14] with creates many dbs

## Build args

```text
Timezone = Europe/Moscow
Locale = ru_RU.utf8
create_second_db.sh - creates many databases when the container starts
```

## Versions

```text
* postgres:12.8.1, postgres:12.8, postgres:12
* postgres:13.4.1, postgres:13.4, postgres:13
* postgres:14.0.1, postgres:14.0, postgres:14, latest
```

## docker run

```text
docker run -d --name postgres \
    -e POSTGRES_USER=u$er \
    -e POSTGRES_PASSWORD=pa$$w0rd \
    -e POSTGRES_MULTIPLE_DATABASES=db1,db2,db3 \
    -p 5432:5432 \
    -v postgres-volume:/var/lib/postgresql/data \
    abramovk/postgres:12-latest
```

## docker-compose

```text
  postgres:
    image: abramovk/postgres:12-latest
    environment:
      POSTGRES_USER: u$er
      POSTGRES_PASSWORD: pa$$w0rd
      POSTGRES_MULTIPLE_DATABASES: db1,db2,db3
    ports:
      - "5432:5432"
    volumes:
      - postgres-volume:/var/lib/postgresql/data
```
