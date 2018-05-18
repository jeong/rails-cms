#!/bin/sh

rm -rf tmp/pids/*

until nc -z db 3306; do
    echo "MySQL is not ready, sleeping..."
    sleep 10
done

exec "$@"
