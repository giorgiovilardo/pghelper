container_name := "pgsandbox"

[private]
default:
    @just --list --unsorted

start name=container_name:
    docker run --name {{name}} -e POSTGRES_PASSWORD=pw --rm -d -p 5432:5432 postgres:latest

stop name=container_name:
    docker kill {{name}}

shell name=container_name:
    docker exec -u postgres -it {{name}} bash

psql name=container_name:
    docker exec -u postgres -it {{name}} psql

restore name=container_name:
    cat 176.sql | docker exec -u postgres -i {{name}} pg_restore --dbname=postgres --single-transaction --no-owner --disable-triggers

