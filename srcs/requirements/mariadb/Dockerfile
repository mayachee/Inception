
FROM	debian:bookworm

COPY	./tools/init_database.sh /

RUN	apt-get update && apt-get install -y mariadb-server \
	mariadb-client && mkdir -p /data /run/mysqld && \
	chown -R mysql:mysql /data /run/mysqld && \
	chmod +x init_database.sh && apt-get clean && rm -rf /var/lib/apt/lists/* 

ENTRYPOINT	["./init_database.sh"]
