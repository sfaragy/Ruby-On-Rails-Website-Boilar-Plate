FROM ruby:3.0.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client nano

RUN mkdir noteapp
WORKDIR /noteapp

ADD Gemfile /noteapp/Gemfile
ADD Gemfile.lock /noteapp/Gemfile.lock
ADD Makefile Makefile

## add non-root user
RUN chown -R $USER:$USER /noteapp


RUN bundle install


RUN . /noteapp

