FROM ruby:2.3.1

MAINTAINER Hirofumi Wakasugi <baenej@gmail.com>

RUN apt-get update && apt-get install -qq -y \
      build-essential nodejs \
      mecab libmecab-dev mecab-ipadic-utf8 \
      --fix-missing --no-install-recommends

ENV APP_PATH /app
RUN mkdir $APP_PATH

WORKDIR $APP_PATH

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install --without developmet test --jobs 4 --retry 5 --deployment

ENV RAILS_ENV production
ENV RACK_ENV production

COPY . ./

RUN bin/rails assets:precompile
# Cannot execute rails db:migrate since the database does not exist while building an image
# RUN bin/rails db:migrate

RUN bin/rails index:get_keywords
# Cannot execute index:create rake task since the elasticsearch does not exist while building an image
# RUN bin/rails index:create

CMD bundle exec puma -C config/puma.rb
