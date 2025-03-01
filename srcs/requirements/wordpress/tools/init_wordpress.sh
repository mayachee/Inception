#!/bin/sh

. $SEC_FILE

cd /var/www/html

if [ ! -f wp-cli.phar ]; then
    echo "Downloading WP-CLI..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
fi

echo "Waiting for MariaDB intialisation...."
until mysqladmin ping -h $DB_HOST --silent; do
    sleep 2
done

if [ ! -f wp-config.php ]; then
    echo "Downloading WordPress core files...."
    ./wp-cli.phar core download --allow-root
    echo "Creating wp-config.php...."
    ./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASSWORD --dbhost=$DB_HOST --allow-root
    echo "Installing WordPress...."
    ./wp-cli.phar core install --url=https://mayache.42.fr --title="Inception" \
        --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_USER_EMAIL --allow-root
    ./wp-cli.phar user create user1 mayacheeAdmine@gmail.com --role=editor --user_pass=user1 --allow-root
else
    echo "WordPress is already installed !"
fi

echo "Starting PHP-FPM...."
php-fpm8.2 -F
