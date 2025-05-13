all : up

up : 
	@sudo mkdir -p /home/dren/data/db
	@sudo mkdir -p /home/dren/data/wp
	@sudo chmod 777 /home/dren/data/wp
	@sudo chmod 777 /home/dren/data/db
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

down :
	docker compose -f ./srcs/docker-compose.yml down -v

re:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

status : 
	@echo "\033[1;32mDOCKER:\033[0m"
	@sudo docker ps
	@echo "\n\033[1;32mNETWORK:\033[0m"
	@sudo docker network ls
	@echo "\n\033[1;32mIMAGES:\033[0m"
	@sudo docker images

clear :

	@sudo rm -rf /home/dren/data/db
	@sudo rm -rf /home/dren/data/wp
	@sudo docker system prune -af --volumes
	@sudo docker volume rm -f srcs_db || true
	@sudo docker volume rm -f srcs_wp || true


clean :
	@docker ps -q | xargs -r docker stop
	@docker ps -a -q | xargs -r docker rm
	@docker images -q | xargs -r docker rmi
	@sudo docker network prune -f

fclean: clear clean

.PHONY: all clean fclean re status