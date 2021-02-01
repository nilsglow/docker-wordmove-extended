FROM welaika/wordmove:php7

RUN apt-get update && apt-get install -y \
	php-xml \
    && rm -rf /var/lib/apt/lists/*
