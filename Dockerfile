FROM ruby:2.4.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.li

RUN apt-get update && apt-get install -y build-essential libpq-dev

RUN curl -sL https://deb.nodesource.com/setup_6.x
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN npm install n -g
RUN n latest
RUN n ls
# RUN npm install v6.10.0

RUN npm install --global yarn


RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
