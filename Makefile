# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kfergani <kfergani@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/30 05:51:35 by kfergani          #+#    #+#              #
#    Updated: 2023/05/31 16:31:06 by kfergani         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE = ./srcs/docker-compose.yml

DB_VOLUME = /home/kfergani/data/mysql
WP_VOLUME = /home/kfergani/data/wordpress

all: run

run:
	@sudo mkdir -p $(DB_VOLUME)
	@sudo mkdir -p $(WP_VOLUME)
	@sudo docker compose -f $(COMPOSE_FILE) up --build 

rm-volume:
	@sudo rm -rf $(DB_VOLUME)
	@sudo rm -rf $(WP_VOLUME)

prune:
	@sudo docker system prune -a

fclean:
	@sudo docker compose -f $(COMPOSE_FILE) down
	@sudo rm -rf $(DB_VOLUME)
	@sudo rm -rf $(WP_VOLUME)
	@sudo docker image rm -f srcs_nginx
	@sudo docker image rm -f srcs_wordpress
	@sudo docker image rm -f srcs_mariadb


re: fclean run
	
.PHONY: all run rm-volume prune fclean re