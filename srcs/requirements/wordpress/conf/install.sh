#!/bin/sh

# Instalamos el nucleo con los datos del .env
wp core install --path=/var/www --url=domain_here \
    --title="caquinta's inception" \
    --admin_name=wp_admin_user_here \
    --admin_user=wp_admin_user_here \
    --admin_password=wp_admin_password_here \
    --admin_email=wp_admin_email_here \
    --skip-email --allow-root

# Instalamos un tema
wp theme install inspiro --path=/var/www --activate --allow-root

exec "$@"
