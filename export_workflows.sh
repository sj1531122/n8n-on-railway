#!/usr/bin/env bash

: ${EXPORT_DIR:="n8n-$(date +%Y%m%d)"}

set -euo

docker run \
    -e N8N_ENCRYPTION_KEY \
    -e GENERIC_TIMEZONE \
    -e TimeZ \
    -e DB_TYPE \
    -e DB_POSTGRESDB_DATABASE \
    -e DB_POSTGRESDB_HOST \
    -e DB_POSTGRESDB_PORT \
    -e DB_POSTGRESDB_USER \
    -e DB_POSTGRESDB_SCHEMA \
    -e DB_POSTGRESDB_PASSWORD \
    -v $EXPORT_ROOT:/backup \
    -u node \
    reorx/n8n-custom n8n export:workflow --backup --output=/backup/$EXPORT_DIR/
