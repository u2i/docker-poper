ARG VERSION=0.2.3

FROM ruby:alpine

ARG VERSION

RUN apk add --virtual deps --no-cache build-base cmake libgit2-dev \
    && apk add --no-cache libgit2 dumb-init \
    && gem install --no-document -v $VERSION poper \
    && apk del deps

WORKDIR /code
VOLUME /code

ENTRYPOINT ["/usr/bin/dumb-init", "--", "poper"]

