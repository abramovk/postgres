#!/usr/bin/env bash

echo Enter major version:
read major

echo Enter minor version:
read minor

echo Enter build number:
read build

latest=""
push=""

if [[ $major == 14* ]]; then
    latest="-t abramovk/postgres:latest "
    push="docker push abramovk/postgres:latest"
fi

docker build --no-cache --build-arg POSTGRES_VERSION=$major.$minor -t abramovk/postgres:$major.$minor.$build -t abramovk/postgres:$major.$minor -t abramovk/postgres:$major $latest.

docker push abramovk/postgres:$major.$minor.$build
docker push abramovk/postgres:$major.$minor
docker push abramovk/postgres:$major
$latest
