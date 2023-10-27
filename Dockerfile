FROM welaika/wordmove:latest

RUN apt-get update && apt-get install -y \
	php-xml \
    && rm -rf /var/lib/apt/lists/*

# we override WORDMOVE_WORKDIR from /html because that is a problem in wp-cli db search and replace

ENV WORDMOVE_WORKDIR /var/www/html

WORKDIR ${WORDMOVE_WORKDIR}
