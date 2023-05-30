FROM debian:buster

EXPOSE 3306

RUN apt update \
	&& apt install -y mariadb-server

COPY	./test.sh ./test.sh

RUN mkdir /var/run/mysqld \
	&& chown mysql:mysql /var/run/mysqld

ENTRYPOINT [ "./test.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]