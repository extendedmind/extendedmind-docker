#!/bin/bash
set -e

if [ -e /etc/piwik/templates/piwik.config.ini.php ]; then
  envsubst < /etc/piwik/templates/piwik.config.ini.php > /usr/src/piwik/config/config.ini.php
fi

if [ ! -e piwik.php ]; then
	tar cf - --one-file-system -C /usr/src/piwik . | tar xf -
	chown -R www-data .
fi

exec "$@"
