# image size ~1GB
FROM ruby:2.6.0

WORKDIR /rails-example-project
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
COPY . .
# update gemfile to install tzinfo-data for alpine, not just windows
# RUN sed --in-place='' "s/\(gem 'tzinfo-data', platforms.*\)]/\1, :ruby]/" Gemfile
RUN bundle update && bundle install
# make a secret key otherwise rails db step fails
ENV RAILS_ENV=production SECRET_KEY_BASE="$(rails secret)"
RUN rails db:migrate
RUN rake assets:precompile
EXPOSE 3000
CMD ["rails", "s", "-e", "production"]
