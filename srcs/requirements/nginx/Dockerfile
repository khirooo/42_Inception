FROM debian:buster

EXPOSE 443
RUN apt update \
	&& apt install -y nginx  openssl

RUN mkdir -p /ssl \
	&& cd /ssl \
	&& openssl genpkey -algorithm RSA -out nginx.key \
	&& openssl req -new -key nginx.key -out nginx.csr -subj "/C=DE/ST=Heilbronn /L=Heilbronn /O=42/CN=42heilbronn.com" \
	&& openssl req -x509 -sha256 -days 365 -key nginx.key -in nginx.csr -out nginx.crt


COPY conf /etc/nginx/conf.d/wp.conf


ENTRYPOINT ["nginx", "-g", "daemon off;"]
