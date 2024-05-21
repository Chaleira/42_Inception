FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install -y mariadb-server

# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
# COPY tools/setup.sh /

ENV SQL_ROOT_PASSWORD=root_password
ENV SQL_DATABASE=wordpress
ENV SQL_USER=wordpress
ENV SQL_PASSWORD=wordpress_password

WORKDIR /

# RUN chmod +x setup.sh
# RUN ./setup.sh

# EXPOSE 3306

# CMD ["bin/sh", "setup.sh"]

#   docker build -t mariadb srcs/requirements/mariadb
#   docker stop mariadb && docker run --rm -d -t --name mariadb mariadb