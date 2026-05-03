#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE leadar_backend;
    CREATE DATABASE leadar_bot;

    CREATE USER backend_user WITH PASSWORD '$BACKEND_DB_PASSWORD';
    CREATE USER bot_user WITH PASSWORD '$BOT_DB_PASSWORD';

    GRANT ALL PRIVILEGES ON DATABASE leadar_backend TO backend_user;
    GRANT ALL PRIVILEGES ON DATABASE leadar_bot TO bot_user;
EOSQL
