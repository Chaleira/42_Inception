FROM debian:oldstable

RUN apt-get update -y && \
    apt-get install -y wget curl php php-mysqli php-fpm

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN wget http://wordpress.org/latest.tar.gz && \
    tar xfz latest.tar.gz && \
    rm -rf latest.tar.gz

COPY ./conf/wp-config.php /wordpress/

COPY ./conf/setup.sh /
RUN chmod +x /setup.sh

EXPOSE 9000

ENTRYPOINT [ "tail", "-f", "/dev/null" ]
# CMD [ "bash", "setup.sh" ]

#   docker build -t wordpress srcs/requirements/wordpress
#   docker stop wordpress && docker run --rm -d --name wordpress wordpress