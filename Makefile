all:
	sudo mkdir -p /home/iyes/data/mariadb
	sudo mkdir -p /home/iyes/data/wordpress
	sudo chmod 777 /home/iyes/data/wordpress
	sudo chmod 777 /home/iyes/data/mariadb
	cd srcs && docker-compose up --build 

clean:
	cd srcs && docker-compose down
	# docker system prune -f --volumes
	sudo rm -rf /home/iyes/data/mariadb
	sudo rm -rf /home/iyes/data/wordpress

fclean:
	make clean
	echo "Removing all the containers, images and volumes"
	docker system prune -a -f --volumes
	docker network prune -f
	docker network rm $$(docker network ls -q) 2>/dev/null || true
	docker volume rm $$(docker volume ls -qf dangling=true) 2>/dev/null || true
	sudo rm -rf /home/iyes/data/mariadb
	sudo rm -rf /home/iyes/data/wordpress
re:
	make fclean
	make all