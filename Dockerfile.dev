FROM ruby:2.6.5

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get update && apt-get install -y nodejs postgresql-client  && rm -rf /var/lib/apt/lists/* \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/*

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
RUN yarn install
COPY . /myapp

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0", "-C", "--no-dev-caching", "-e", "development"]

EXPOSE 3000
