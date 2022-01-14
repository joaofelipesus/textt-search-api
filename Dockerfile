FROM ruby:3.1

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
build-essential libpq-dev imagemagick git-all nano graphviz

RUN echo 'alias rspec="bundle exec rspec"' >> ~/.bashrc && \
    echo 'alias rails="bundle exec rails"' >> ~/.bashrc

# env var with workdir path
ENV INSTALL_PATH /store

# github actions use on test pipeline
ENV DEV_DATABASE "postgres"

# create workdir
RUN mkdir -p $INSTALL_PATH

# define initial location of the container
WORKDIR $INSTALL_PATH

# copy Gemfile to container
COPY Gemfile ./

# gems path
ENV BUNDLE_PATH /gems

# copy application dir to container
COPY . .
