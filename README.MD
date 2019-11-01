## Minio Development

A MinIO image suited for development purposes.

## What is MinIO?

Its a 100% opensource s3 server implementation. You can see more information here: https://min.io/

## Why this project exists?

To provide an image suited for development which means:

 * Create an default bucket to work with;
 * Configure bucket default permission through environment variables.

By default, you cannot create a default/initial bucket during startup (https://github.com/minio/minio/issues/4769). Instead, you need to create a 2nd service on docker-compose or at least use a `docker exec` to configure the first bucket and its permission.

With this project, you just need to provide `MINIO_INITIAL_BUCKET` and `MINIO_INITIAL_BUCKET_PERMISSION` that will be used by the entrypoint to create the default bucket and set its permissions. In fact if dont provide those environment variables, the bucket `default` with permission `none`(private) will be created anyway.

## Using Volumes

By default, the entrypoint is hardcoded to use `/data` as the exported dir; so you can just mount a volume in the `/data` location to preserve data.

## How to start

Be sure to have Docker and Docker-compose installed. After that, just download `docker-compose.yaml` available on the project and spin up the server using `docker-compose up -d` command.

Author
------

Author: Gabriel Abdalla Cavalcante Silva (gabriel.cavalcante88@gmail.com)

