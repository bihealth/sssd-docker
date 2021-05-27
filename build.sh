#!/bin/bash

REPO=ghcr.io/bihealth/sssd-docker
SSSD_VERSION=${SSSD_VERSION-1.16.5-10}

docker build \
    -t "${REPO}:${SSSD_VERSION}" \
    -t "${REPO}:latest" \
    docker

echo "Now do"
echo
echo "  docker push ${REPO}:${SSSD_VERSION}"
echo "  docker push ${REPO}:latest"
