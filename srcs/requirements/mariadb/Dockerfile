# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mayache- <mayache-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/28 13:32:37 by mayache-          #+#    #+#              #
#    Updated: 2025/02/28 13:32:38 by mayache-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:bookworm

COPY	./tools/init_database.sh /

RUN	apt-get update && apt-get install -y mariadb-server \
	mariadb-client && mkdir -p /data /run/mysqld && \
	chown -R mysql:mysql /data /run/mysqld && \
	chmod +x init_database.sh && apt-get clean && rm -rf /var/lib/apt/lists/* 

ENTRYPOINT	["./init_database.sh"]
