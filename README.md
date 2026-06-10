# Dockerized SSSD

This repository contains the necessary files to build a Docker image for SSSD.
We use this in [bihealth/irods-docker](https://github.com/bihealth/irods-docker) to connect our iRODS server to upstream ActiveDirectory servers.

## What's this?

This is a Docker image from CUBI @bihealth that we use for our iRODS deployment.

## Building

```bash
$ bash build.sh
```

## Running

Edit the file `config/sssd/sssd.conf.example`, then run the container with bind-mounts for the SSSD configuration file and LDAP TLS certificates (if needed).
The command may look similar to this:

```bash
docker run --rm \
  -v ./config/sssd/sssd.conf.example:/etc/sssd/sssd.conf \
  -v ./path/to/ldap/cert.pem:/etc/ssl/certs/ldap_cert_1.pem \
  -v ./path/to/ldap/cert.pem:/etc/ssl/certs/ldap_cert_1.pem \
  -it ghcr.io/bihealth/sssd-docker:latest
```

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
