#!/bin/bash

set -euo pipefail

init-var-lib()
(
  LIB=/var/lib/sss

  mkdir -p ${LIB}/sss/{deskprofile,pipes/private,mc,db,keytabs,gpo_cache,secrets,pubconf/krb5.include.d}

  chown root:root ${LIB}/sss
  chown root:root ${LIB}/sss/deskprofile
  chown sssd:sssd ${LIB}/sss/pipes
  chown sssd:sssd ${LIB}/sss/pipes/private
  chown sssd:sssd ${LIB}/sss/mc
  chown sssd:sssd ${LIB}/sss/db
  chown sssd:sssd ${LIB}/sss/keytabs
  chown sssd:sssd ${LIB}/sss/gpo_cache
  chown root:root ${LIB}/sss/secrets
  chown sssd:sssd ${LIB}/sss/pubconf
  chown sssd:sssd ${LIB}/sss/pubconf/krb5.include.d

  chmod 755 ${LIB}/sss
  chmod 755 ${LIB}/sss/deskprofile
  chmod 755 ${LIB}/sss/pipes
  chmod 750 ${LIB}/sss/pipes/private
  chmod 775 ${LIB}/sss/mc
  chmod 700 ${LIB}/sss/db
  chmod 700 ${LIB}/sss/keytabs
  chmod 755 ${LIB}/sss/gpo_cache
  chmod 700 ${LIB}/sss/secrets
  chmod 755 ${LIB}/sss/pubconf
  chmod 755 ${LIB}/sss/pubconf/krb5.include.d
)

for x in /etc/sssd.in/*; do
  cp $x /etc/sssd
  chown root:root /etc/sssd/$(basename $x)
  chmod u=rw,go= /etc/sssd/$(basename $x)
done

if [[ "$1" == sssd ]]; then
  init-var-lib
  exec sssd -i --logger=stderr
else
  exec "$@"
fi

exit $?
