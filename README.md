# Dockerized SSSD

This repository contains the necessary files to build a Docker image for SSSD.
We use this in [bihealth/irods-docker](https://github.com/bihealth/irods-docker) to connect our iRODS server to upstream ActiveDirectory servers.

## What's this?

This is a Docker image from CUBI @bihealth that we use for our iRODS deployment.

## Building

```bash
$ cd docker
$ docker build . -t ghcr.io/bihealth/sssd-docker:latest
```

122   sssd:
123     build:
124       context: ./sssd
125     image: bihealth/sssd
126     restart: unless-stopped
127     volumes:
128       - "./config/sssd/sssd.conf:/etc/sssd.in/sssd.conf:ro"
129       - "./volumes/sss:/var/lib/sss:rw"

## Data Persistency

Each container exposes volumes for data persistency.
The list of volumes are provided in the table below:

| path in container               | usage                         |
|---------------------------------|-------------------------------|
| /etc/sssd.in/ssd.conf           | SSSD configuration |
| /var/lib/sss                    | SSSD sockets |

On startup, the files from `/etc/sssd.in` are copied to `/etc/sssd` as SSSD really does not like files owned by other users.

## Commands

The following commands are available.
If you specify anything else then the startup script will `exec` this command (e.g., `bash`).

- `sssd` (default) -- run SSSD

## Environment Variables

N/A
