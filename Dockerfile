FROM ruby:2.7.4

# ARG LP_PRELOAD_PATH

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    default-mysql-client \
    nodejs \
    libjemalloc2 \
  && rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

RUN gem install bundler -v '~>2'

RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
