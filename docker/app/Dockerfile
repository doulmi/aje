FROM ruby:2.6.5-alpine

ENV PROJECT afe

RUN mkdir -p $PROJECT
WORKDIR $PROJECT

RUN apk add git
RUN apk add --update bash perl
RUN apk add libxslt-dev libxml2-dev build-base
RUN apk add --no-cache file
RUN apk add yarn --no-cache


COPY . ./

RUN bundle install
RUN yarn install
VOLUME /$PROJECT

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets

RUN mkdir -p /tmp/public && \
    cp -rf /afe/public/* /tmp/public

EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
