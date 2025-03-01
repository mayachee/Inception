#!/bin/sh

. $SEC_FILE

if [ ! -d "$DATA_DIR/mysql" ]; then
    echo "Initializing MariaDB data directory...."
    mysql_install_db --user=$MYSQL_USER --datadir=$DATA_DIR > /dev/null 2>&1
    echo "MariaDB data directory initialized"
else
    echo "MariaDB data directory already exists."
fi

# Start the MariaDB server in the background
echo "Starting MariaDB server..."
mysqld --user=$MYSQL_USER --datadir=$DATA_DIR > /dev/null 2>&1 &
MYSQL_PID=$!
echo "Waiting MariaDB...."
sleep 5

echo "Setting up the database and users...."
# mysql -u root  < ./init.sql
mysql --user=root << EOF
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

if [ $? -eq 0 ]; then
    echo "Database and user is created !"
else
    echo "Error: During database and users creation please fix issue on init_database.sh !" >&2
fi

echo "Aborting MariaDB server...."
kill $MYSQL_PID
wait $MYSQL_PID

# Start MariaDB server with networking enabled
echo "Launching MariaDB server...."
exec mysqld --user=$MYSQL_USER --datadir=$DATA_DIR --port=3306 --bind-address=0.0.0.0 --skip-networking=0
