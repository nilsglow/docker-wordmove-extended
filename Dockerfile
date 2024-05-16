FROM welaika/wordmove:latest

RUN gem install ed25519 bcrypt_pbkdf

RUN apt-get update && apt-get install -y \
	php7.4-xml \
    && rm -rf /var/lib/apt/lists/*

# we override WORDMOVE_WORKDIR from /html because that is a problem in wp-cli db search and replace
ENV WORDMOVE_WORKDIR /var/www/html

WORKDIR ${WORDMOVE_WORKDIR}

# we need a user with id 1000
RUN groupadd --gid 1000 wordmove
RUN useradd --uid 1000 --gid wordmove --create-home --shell /bin/bash wordmove

USER wordmove
