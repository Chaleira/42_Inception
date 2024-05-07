FROM debian:stable

RUN apt-get update && apt-get install -y \
    curl \
    tar \
    php \
    php-fpm \
    php-mysql \
    && rm -fr /var/lib/apt/lists/*

RUN curl -O https://wordpress.org/latest.tar.gz && tar -xvf latest.tar.gz

EXPOSE 9000

CMD ["php-fpm", "-F"]