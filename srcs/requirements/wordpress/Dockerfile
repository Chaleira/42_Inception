FROM debian:oldstable

RUN apt-get update -y && \
    apt-get install -y wget curl php php-mysqli php-fpm netcat

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

RUN rm -rf /var/www/html/*

RUN wget http://wordpress.org/latest.tar.gz && \
    tar xfz latest.tar.gz && \
    rm -rf latest.tar.gz

RUN mv wordpress/* . && chown -R www-data:www-data /var/www/html

RUN rm -rf wordpress

COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/setup.sh /
RUN chmod +x /setup.sh

EXPOSE 9000

CMD [ "bash", "/setup.sh" ]
# ENTRYPOINT [ "tail", "-f", "/dev/null" ]

#   docker build -t wordpress srcs/requirements/wordpress
#   docker stop wordpress && docker run --rm -d --name wordpress wordpress