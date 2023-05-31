FROM debian:buster

EXPOSE 443
RUN apt update \
	&& apt install -y nginx  openssl

RUN mkdir -p /ssl \
	&& cd /ssl \
	&& openssl genpkey -algorithm RSA -out nginx.key \
	&& openssl req -new -key private.key -out nginx.csr \
	&& openssl req -new -key private.key -out nginx.csr -subj "/C=DE/ST=Heilbronn /L=Heilbronn /O=42/CN=42heilbronn.com"

COPY conf /etc/nginx/conf.d/wp.conf


ENTRYPOINT ["nginx", "-g", "daemon off;"]
