IMAGES = nginx wordpress alpine:3.16 mariadb redis vsftpd adminer static_page cadvisor

CONTAINER = nginx wordpress mariadb redis vsftpd adminer static_page cadvisor

all : build

build:
	mkdir -p /home/yassine/data/mariadb
	mkdir -p /home/yassine/data/wordpress
	mkdir -p /home/yassine/data/static
	docker-compose -f srcs/docker-compose.yml up --build --detach
	docker ps

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean: stop
	-docker stop $(CONTAINER)
	-docker rm -f $(CONTAINER)
	-docker rmi -f $(IMAGES)
	-docker volume rm -f `docker volume ls`
	-docker-compose -f srcs/docker-compose.yml down

volume: clean
	sudo rm -rf /home/yassine/data/wordpress/
	sudo rm -rf /home/yassine/data/mariadb/
	sudo rm -rf /home/yassine/data/static/

re: volume clean all

.PHONY: all build clean clean re
