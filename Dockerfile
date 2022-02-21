FROM busybox as downloader
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x wait-for-it.sh

FROM minio/minio:RELEASE.2022-02-18T01-50-10Z
COPY --from=minio/mc /usr/bin/mc /usr/local/bin/mc
COPY --from=downloader /wait-for-it.sh /usr/local/bin/wait-for-it
COPY entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
CMD []
