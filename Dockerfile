FROM ruby:2.5.1-alpine3.7

RUN apk add --no-cache bash

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install --quiet

COPY . ./

CMD 'rackup'
