FROM busybox as downloader
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x wait-for-it.sh

FROM minio/minio:RELEASE.2025-09-07T16-13-09Z
RUN microdnf install nc
COPY --from=minio/mc /usr/bin/mc /usr/local/bin/mc
COPY --from=downloader /wait-for-it.sh /usr/local/bin/wait-for-it
COPY entrypoint.sh /entrypoint

VOLUME ["/data"]

ENTRYPOINT ["/entrypoint"]
CMD []
