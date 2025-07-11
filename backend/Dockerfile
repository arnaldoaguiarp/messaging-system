FROM ruby:3.4.4

ENV RAILS_ENV=production \
    RAILS_LOG_TO_STDOUT=true

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libyaml-dev

WORKDIR /rails

COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs 4 --retry 3 && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache

COPY . .

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["rails", "server"]