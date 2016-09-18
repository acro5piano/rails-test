FROM ruby:2.3.1
RUN apt-get update
RUN apt-get install -y build-essential git-core \
    libssl-dev libyaml-dev libxslt-dev libxml2-dev \
    libmysqlclient-dev libpq-dev postgresql-client

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
