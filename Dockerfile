FROM ruby:3.0.3

RUN apt-get update -qq && \
  apt-get install -y \
  build-essential \
  default-mysql-client \
  nodejs \
  libjemalloc2 \
  && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

RUN gem install bundler -v '~>2'

RUN bundle install --jobs $(nproc)

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
