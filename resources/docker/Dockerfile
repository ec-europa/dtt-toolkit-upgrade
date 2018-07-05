FROM fpfis/httpd-php-dev:5.6

# Uploadprogress
RUN git clone https://github.com/php/pecl-php-uploadprogress/ /usr/src/php/ext/uploadprogress/ && \
    docker-php-ext-configure uploadprogress && \
    docker-php-ext-install uploadprogress && \
    rm -rf  /usr/src/php/ext/uploadprogress

RUN apk add --no-cache patch

### Add dev settings :
ADD dev.ini /usr/local/etc/php/conf.d/95-dev.ini