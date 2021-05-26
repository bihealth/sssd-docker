# Build container running sssd on CentOS 7.
FROM centos:7

LABEL org.opencontainers.image.source https://github.com/bihealth/sssd-docker

# Cleanup software package and install latest updates.
RUN yum clean all && \
    yum upgrade -y

# Install SSSD.
RUN yum install -y \
        sssd \
        sssd-ldap \
        sssd-tools

# Define the entry point.
COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh && \
    ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sssd"]
EXPOSE 8080/tcp
