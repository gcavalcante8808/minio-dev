FROM minio/minio:8445-9573ea5
RUN apk add --no-cache bash
COPY --from=minio/mc /usr/bin/mc /usr/local/bin/mc
COPY --from=jwilder/dockerize /usr/local/bin/dockerize /usr/local/bin/dockerize
COPY entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
CMD []
