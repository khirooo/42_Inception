# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kfergani <kfergani@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/30 05:51:35 by kfergani          #+#    #+#              #
#    Updated: 2023/05/31 16:23:51 by kfergani         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE_FILE = ./srcs/docker-compose.yml

DB_VOLUME = /home/kfergani/data/mysql
WP_VOLUME = /home/kfergani/data/wordpress

all: run

run:
	@ mkdir -p $(DB_VOLUME)
	@ mkdir -p $(WP_VOLUME)
	@ docker compose -f $(COMPOSE_FILE) up --build 

rm-volume:
	@ rm -rf $(DB_VOLUME)
	@ rm -rf $(WP_VOLUME)

prune:
	@ docker system prune -a

fclean:
	@ docker compose -f $(COMPOSE_FILE) down
	@ rm -rf $(DB_VOLUME)
	@ rm -rf $(WP_VOLUME)
	@ docker image rm -f srcs_nginx
	@ docker image rm -f srcs_wordpress
	@ docker image rm -f srcs_mariadb


re: fclean run
	
.PHONY: all run rm-volume prune fclean re