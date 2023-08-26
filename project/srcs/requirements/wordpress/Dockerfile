FROM alpine:3.17
ARG PHP_VERSION \
    DB_NAME \
    DB_USER \
    DB_PASS
RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-phar \
    # php${PHP_VERSION}-redis \
    wget \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php81/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*
WORKDIR /var/www
EXPOSE 9000
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm -rf latest.zip
COPY requirements/wordpress/conf/wp-config-create.sh .
RUN sh wp-config-create.sh && rm wp-config-create.sh && \
    chmod -R 0777 wordpress/wp-content/
COPY requirements/wordpress/conf/install.sh /usr/local/bin/install.sh
RUN chmod +x /usr/local/bin/install.sh && \
    sed -i "s|wordpress_admin_user_here|$DB_USER|g" /usr/local/bin/install.sh && \
    sed -i "s|wordpress_admin_password_here|$DB_PASS|g" /usr/local/bin/install.sh
CMD ["sh", "-c", "install.sh && /usr/sbin/php-fpm81 -F"]

