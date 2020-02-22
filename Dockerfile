FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /black_widow
WORKDIR /black_widow
COPY Gemfile /black_widow/Gemfile
COPY Gemfile.lock /black_widow/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

ARG RAILS_ENV=development
RUN if [ "$RAILS_ENV" = "production" ]; then SECRET_KEY_BASE=$(rake secret) bundle exec rake assets:precompile; fi

CMD ['rails', 'server']
