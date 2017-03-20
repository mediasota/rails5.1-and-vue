FROM ruby:2.4.0

RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs npm

RUN mkdir /backend

WORKDIR  /backend
ADD Gemfile /backend/Gemfile
ADD Gemfile.lock /backend/Gemfile.lock
RUN bundle install

ADD . /backend
