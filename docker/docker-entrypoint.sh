#!/bin/bash

set -euo pipefail

for x in /etc/sssd.in/*; do
  cp $x /etc/sssd
  chown root:root /etc/sssd/$(basename $x)
  chmod u=rw,go= /etc/sssd/$(basename $x)
done

if [[ "$1" == sssd ]]; then
  exec sssd -i --logger=stderr
else
  exec "$@"
fi

exit $?
