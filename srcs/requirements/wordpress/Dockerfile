# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mayache- <mayache-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/28 13:33:42 by mayache-          #+#    #+#              #
#    Updated: 2025/02/28 13:33:43 by mayache-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt update -y \
    && apt install -y \
    php-fpm \
    php-mysqli \
    php-zip \
    php-gd \
    curl \
    unzip \
    mariadb-client \
    && apt clean

# Copy the PHP-FPM configuration file and WordPress installation script
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY ./tools/init_wordpress.sh /init_wordpress.sh
RUN chmod +x /init_wordpress.sh

# Set working directory
WORKDIR /var/www/html
RUN chmod -R 755 /var/www/html


ENTRYPOINT ["/init_wordpress.sh"]
