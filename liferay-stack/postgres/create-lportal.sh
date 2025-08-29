#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER liferay;
	CREATE DATABASE lportal;
	GRANT ALL PRIVILEGES ON DATABASE lportal TO liferay;
EOSQL
