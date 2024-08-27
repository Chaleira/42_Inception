FROM debian:oldstable

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

# req -x509 is to create a self-signed certificate
# -nodes is to not encrypt the private key
# -out is to specify the output file
# -keyout is to specify the private key file
# -subj is to specify the subject of the certificate wihtout prompting
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42/OU=42/CN=plopes-c.42.fr/UID=plopes-c"

EXPOSE 443

COPY conf/nginx.conf /etc/nginx/conf.d/

CMD [ "nginx", "-g", "daemon off;" ]

# ENTRYPOINT [ "tail", "-f", "/dev/null" ]