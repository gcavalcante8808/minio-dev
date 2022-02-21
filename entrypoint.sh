#!/bin/bash

set -em

configure_initial_bucket () {
    wait-for-it -t 30 localhost:9000
    mc config host add default http://localhost:9000 ${MINIO_ACCESS_KEY} ${MINIO_SECRET_KEY}
    mc mb --ignore-existing default/"${MINIO_INITIAL_BUCKET:-default}"
    mc policy set "${MINIO_INITIAL_BUCKET_PERMISSION:-none}" default/"${MINIO_INITIAL_BUCKET:-default}"
}

start_minio_server_in_background () {
    minio server /data &
}

return_minio_server_to_foreground () {
  fg
}


start_minio_server_in_background

if [[ ! -f "/root/.mc/config.json" ]]; then
    configure_initial_bucket
fi

return_minio_server_to_foreground
