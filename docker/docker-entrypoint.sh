#!/bin/bash

set -euo pipefail

chown root:root /etc/sssd/sssd.conf
chmod 600 /etc/sssd/sssd.conf

if [[ "$1" == sssd ]]; then
  exec sssd -i --logger=stderr
else
  exec "$@"
fi

exit $?
