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
* v12 latest:
    - docker pull abramovk/postgres:12.8.1
    - docker pull abramovk/postgres:12.8
    - docker pull abramovk/postgres:12

* v13 latest:
    - docker pull abramovk/postgres:13.4.1
    - docker pull abramovk/postgres:13.4
    - docker pull abramovk/postgres:13

* v14 latest:
    - docker pull abramovk/postgres:14.0.1
    - docker pull abramovk/postgres:14.0
    - docker pull abramovk/postgres:14
    - docker pull abramovk/postgres:latest
```

## docker run

```text
docker run -d --name postgres \
    -e POSTGRES_USER=u$er \
    -e POSTGRES_PASSWORD=pa$$w0rd \
    -e POSTGRES_MULTIPLE_DATABASES=db1,db2,db3 \
    -p 5432:5432 \
    -v postgres-volume:/var/lib/postgresql/data \
    abramovk/postgres:latest
```

## docker-compose

```text
  postgres:
    image: abramovk/postgres:latest
    environment:
      POSTGRES_USER: u$er
      POSTGRES_PASSWORD: pa$$w0rd
      POSTGRES_MULTIPLE_DATABASES: db1,db2,db3
    ports:
      - "5432:5432"
    volumes:
      - postgres-volume:/var/lib/postgresql/data
```
