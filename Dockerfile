FROM gitlab.brainbits.net:4567/docker/base-php:master

MAINTAINER Stephan Wentz <swentz@brainbits.net>

ADD . /phpcs

WORKDIR /phpcs

RUN echo "memory_limit=-1" > /etc/php7/conf.d/30-memory.ini \
    && composer install --no-dev

WORKDIR /app

ENTRYPOINT ["/phpcs/vendor/bin/phpcs", "--standard=BrainbitsCodingStandard", "--ignore=\"(vendor|tests)\"", "-p"]
