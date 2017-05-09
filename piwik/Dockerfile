# Forked from https://github.com/piwik/docker-piwik
FROM php:5.6-fpm
MAINTAINER timo.tiuraniemi@iki.fi

# ADDITION: From http://stackoverflow.com/a/36908278/2659424
RUN usermod -u 1000 www-data

RUN apt-get update && apt-get install -y \
      libjpeg-dev \
      libfreetype6-dev \
      libgeoip-dev \
      libpng12-dev \
      libldap2-dev \
      zip \
      gettext \
 && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
 	&& docker-php-ext-install -j$(nproc) gd mbstring mysql pdo_mysql zip ldap opcache

RUN pecl install APCu geoip

ENV PIWIK_VERSION 3.0.3

RUN curl -fsSL -o piwik.tar.gz \
      "https://builds.piwik.org/piwik-${PIWIK_VERSION}.tar.gz" \
 && curl -fsSL -o piwik.tar.gz.asc \
      "https://builds.piwik.org/piwik-${PIWIK_VERSION}.tar.gz.asc" \
 && export GNUPGHOME="$(mktemp -d)" \
 && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 814E346FA01A20DBB04B6807B5DBD5925590A237 \
 && gpg --batch --verify piwik.tar.gz.asc piwik.tar.gz \
 && rm -r "$GNUPGHOME" piwik.tar.gz.asc \
 && tar -xzf piwik.tar.gz -C /usr/src/ \
 && rm piwik.tar.gz

COPY php.ini /usr/local/etc/php/php.ini

RUN curl -fsSL -o /usr/src/piwik/misc/GeoIPCity.dat.gz http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz \
 && gunzip /usr/src/piwik/misc/GeoIPCity.dat.gz

# ADDITION: Custom dimensions plugin
RUN curl -fsSL -o /usr/src/piwik/plugins/CustomDimensions.zip https://plugins.piwik.org/api/2.0/plugins/CustomDimensions/download/3.0.0 \
     && unzip /usr/src/piwik/plugins/CustomDimensions.zip -d /usr/src/piwik/plugins/ && rm /usr/src/piwik/plugins/CustomDimensions.zip

COPY docker-entrypoint.sh /entrypoint.sh

# WORKDIR is /var/www/html (inherited via "FROM php")
# "/entrypoint.sh" will populate it at container startup from /usr/src/piwik
VOLUME /var/www/html

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
