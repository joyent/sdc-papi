#!/usr/bin/bash
#
# Copyright (c) 2012 Joyent Inc., All rights reserved.
#

export PS4='[\D{%FT%TZ}] ${BASH_SOURCE}:${LINENO}: ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
set -o xtrace

role=papi
PATH=/opt/smartdc/$role/build/node/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/usr/sbin

$(/opt/local/bin/gsed -i"" -e "s/@@PREFIX@@/\/opt\/smartdc\/papi/g" /opt/smartdc/$role/smf/manifests/$role.xml)

echo "Importing SMF Manifests"
$(/usr/sbin/svccfg import /opt/smartdc/$role/smf/manifests/$role.xml)

exit 0