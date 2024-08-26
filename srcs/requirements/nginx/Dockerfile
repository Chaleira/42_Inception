FROM debian:oldstable

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y nginx openssl
# RUN openssl genpkey -algorithm RSA -out server.key -aes256
# RUN openssl req -new -key server.key -out server.csr
# RUN openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
# RUN openssl x509 -in server.crt -text -noout

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=plopes-c.42.fr/UID=plopes-c"

# RUN mkdir -p /var/run/nginx
# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

COPY conf/nginx.conf /etc/nginx/conf.d/

CMD [ "nginx", "-g", "daemon off;" ]
# ENTRYPOINT [ "tail", "-f", "/dev/null" ]


#   docker build -t nginx srcs/requirements/nginx
#   docker stop nginx && docker run --rm -d -p 443:443 --name nginx nginx