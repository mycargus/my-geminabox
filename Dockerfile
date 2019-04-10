FROM ruby:2.5.1-alpine3.7

RUN apk add --no-cache bash

ENV DOCKER_DATA_STORE /usr/src/app/gem/data
WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install --quiet

RUN mkdir -p gem/data

COPY . ./

EXPOSE 9292

ENTRYPOINT ["rackup", "--host", "0.0.0.0"]
