# image size 361MB
FROM ruby:2.6.0-alpine

WORKDIR /rails-example-project
RUN apk add --update \
  build-base \
  sqlite-dev \
  nodejs \
  npm
COPY . .
# update gemfile to install tzinfo-data for alpine, not just windows
RUN sed --in-place='' "s/\(gem 'tzinfo-data', platforms.*\)]/\1, :ruby]/" Gemfile
RUN bundle update && bundle install
# make a secret key otherwise rails db step fails
ENV RAILS_ENV=production SECRET_KEY_BASE="$(rails secret)"
RUN rails db:migrate
RUN rake assets:precompile
EXPOSE 3000
CMD ["rails", "s", "-e", "production"]
