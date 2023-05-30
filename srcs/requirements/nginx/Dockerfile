FROM debian:buster

EXPOSE 443
RUN apt update \
	&& apt install -y nginx

RUN mkdir -p /ssl

COPY  nginx.* /ssl

COPY conf /etc/nginx/conf.d/wp.conf


ENTRYPOINT ["nginx", "-g", "daemon off;"]
