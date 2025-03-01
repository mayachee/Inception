# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mayache- <mayache-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/28 13:33:25 by mayache-          #+#    #+#              #
#    Updated: 2025/02/28 13:33:26 by mayache-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    nginx openssl && \
    mkdir -p /etc/nginx/ssl /www && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=mayache-.42.fr"

COPY ./conf/default /etc/nginx/sites-available/default
     
# Expose port 443 for HTTPS
EXPOSE 443/tcp
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]