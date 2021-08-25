#!/usr/bin/env bash

set -e
set -u

function create_user_and_database() {
	local database=$1
	echo "  Creating user and database '$database'"
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	    CREATE USER $database;
	    CREATE DATABASE $database;
	    GRANT ALL PRIVILEGES ON DATABASE $database TO $database;
EOSQL
}

function postgis() {
	local database=$1
	echo "  Install postgis on '$database'"
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$database" <<-EOSQL
        CREATE EXTENSION postgis;
        CREATE EXTENSION postgis_raster;
        CREATE EXTENSION postgis_topology;
        CREATE EXTENSION postgis_sfcgal;
        CREATE EXTENSION fuzzystrmatch;
        CREATE EXTENSION address_standardizer;
        CREATE EXTENSION address_standardizer_data_us;
        CREATE EXTENSION postgis_tiger_geocoder;
EOSQL
}

if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
	echo "Multiple database creation requested: $POSTGRES_MULTIPLE_DATABASES"
	for db in $(echo $POSTGRES_MULTIPLE_DATABASES | tr ',' ' '); do
		create_user_and_database $db
        postgis $db
	done
	echo "Multiple databases created"
fi
