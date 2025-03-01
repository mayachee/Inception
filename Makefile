all:
	docker-compose -f ./srcs/docker-compose.yml up --build

build:
	docker-compose -f ./srcs/docker-compose.yml build

up:
	docker-compose up -df ./srcs/docker-compose.yml

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker-compose -f ./srcs/docker-compose.yml down --volumes
	rm -rf /home/mayache-/data/wordpress_files/*
	rm -rf /home/mayache-/data/mariadb_files/*
	rm -rf /home/mayache-/data
	
fclean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	docker system prune -fa --volumes
	docker-compose -f ./srcs/docker-compose.yml down --volumes
	sudo rm -rf /home/mayache-/data/wordpress_files/*
	sudo rm -rf /home/mayache-/data/mariadb_files/*
	sudo rm -rf /home/mayache-/data

data_paths:
	sudo mkdir /home/mayache-/data
	sudo mkdir /home/mayache-/data/wordpress_files
	sudo mkdir /home/mayache-/data/mariadb_files
	sudo chown -R 999:999 /home/mayache-/data/mariadb_files
	sudo chmod -R 777 /home/mayache-/data/mariadb_files
	sudo chown -R 999:999 /home/mayache-/data/wordpress_files
	sudo chmod -R 777 /home/mayache-/data/wordpress_files
