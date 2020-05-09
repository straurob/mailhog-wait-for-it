# mailhog-wait-for-it

This Docker image extends the original [MailHog](https://github.com/mailhog/MailHog) Docker image by adding `wait-for-it.sh` from https://github.com/vishnubob/wait-for-it.

## Motivation

When running both, MailHog and MongoDB, in a Docker environment, it's not unlikely that the MailHog container is up and running before the MongoDB container. In this case MailHog will use its in-memory storage which probably is not what you want.

## Usage

By default, this image will start MailHog exactly as the original image. You can override the default entrypoint, though.

**docker-compose.yml**

```
services:
  mailhog:
    entrypoint: ["wait-for-it.sh", "mongo-db-host:27017", "--strict", "--timeout=120", "--", "MailHog"]
```

This will start MailHog if and only if `wait-for-it.sh` detects a successful TCP connection on `mongo-db-host:27017` within two minutes. Please visit https://github.com/vishnubob/wait-for-it for a full list of options.
