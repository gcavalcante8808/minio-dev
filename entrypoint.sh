#!/bin/bash

set -em

configure_initial_bucket () {
    dockerize -wait tcp://localhost:9000 -timeout 30s
    mc config host add default http://localhost:9000 ${MINIO_ACCESS_KEY} ${MINIO_SECRET_KEY}
    mc mb default/"${MINIO_INITIAL_BUCKET:-default}" || true
    mc policy set "${MINIO_INITIAL_BUCKET_PERMISSION:-none}" default/"${MINIO_INITIAL_BUCKET:-default}"
}

start_minio_server_in_background () {
    /usr/bin/minio server /data &
}

return_minio_server_to_foreground () {
  fg
}


start_minio_server_in_background

if [[ ! -f "/root/.mc/config.json" ]]; then
    configure_initial_bucket
fi

return_minio_server_to_foreground
