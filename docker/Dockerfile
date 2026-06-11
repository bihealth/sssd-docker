# Build container running sssd on Debian.
FROM debian:bookworm

LABEL org.opencontainers.image.source=https://github.com/bihealth/sssd-docker

ENV DEBIAN_FRONTEND=noninteractive

# Install system packages and pin their version.
RUN apt-get update && \
    apt-get install -y \
        'sssd=2.8.*' \
        'sssd-ldap=2.8.*' \
        'sssd-tools=2.8.*'
RUN apt-mark hold sssd sssd-ldap sssd-tools

# Set the working directory.
WORKDIR /usr/local/bin

# Define the entry point.
COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sssd"]
