FROM minio/minio:RELEASE.2020-07-24T22-43-05Z
RUN apk add --no-cache bash
COPY --from=minio/mc /usr/bin/mc /usr/local/bin/mc
COPY --from=jwilder/dockerize /usr/local/bin/dockerize /usr/local/bin/dockerize
COPY entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
CMD []
