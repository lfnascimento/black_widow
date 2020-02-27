FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /black_widow
WORKDIR /black_widow
COPY Gemfile /black_widow/Gemfile
COPY Gemfile.lock /black_widow/Gemfile.lock
ARG BUNDLE_INSTALL_ARGS
RUN gem install bundler && bundle install ${BUNDLE_INSTALL_ARGS} \
  && rm -rf /usr/local/bundle/cache/* \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

COPY entrypoint.sh /usr/bin/
ARG RAILS_ENV=development
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

RUN if [ "$RAILS_ENV" = "production" ]; then SECRET_KEY_BASE=$(bundle exec rails secret) bundle exec rails assets:precompile; fi

CMD ['rails', 'server']
