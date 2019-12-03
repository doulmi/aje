# Dockerfile
FROM ruby:2.6.5-alpine

ENV PROJECT aje

RUN mkdir -p $PROJECT
WORKDIR $PROJECT

RUN apk add git
RUN apk add --update bash perl
RUN apk add libxslt-dev libxml2-dev build-base
RUN apk add mysql-client mysql-dev
RUN apk add --no-cache file
RUN apk add yarn --no-cache

COPY . ./

RUN bundle install
RUN yarn install
VOLUME /$PROJECT

RUN mkdir -p tmp/sockets

RUN mkdir -p /tmp/public && \
    cp -rf /neptune/public/* /tmp/public


# nginx/Dockerfile
FROM nginx:1.17.4-alpine

RUN rm -f /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/conf.d/neptune.conf

CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
