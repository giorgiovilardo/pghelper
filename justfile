container_name := "pgsandbox"

[private]
default:
    @just --list --unsorted

start name=container_name:
    docker run --name {{name}} -e POSTGRES_PASSWORD=pw --rm -d -p 5432:5432 postgres:latest

stop name=container_name:
    docker kill {{name}}

psql name=container_name:
    docker exec -u postgres -it {{name}} psql

