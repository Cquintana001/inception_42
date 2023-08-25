#!/bin/sh

wp core install --path=/var/www --url=caquinta.42.fr \
    --title="42 inception" \
    --admin_name=wordpress_admin_user_here \
    --admin_user=wordpress_admin_user_here \
    --admin_password=wordpress_admin_password_here \
    --admin_email=wp@caquinta.42.fr \
    --skip-email --allow-root

exec "$@"