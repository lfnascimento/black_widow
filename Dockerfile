FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
ARG BUNDLE_INSTALL_ARGS
RUN gem install bundler && bundle install ${BUNDLE_INSTALL_ARGS} \
  && rm -rf /usr/local/bundle/cache/* \
  && find /usr/local/bundle/gems/ -name "*.c" -delete \
  && find /usr/local/bundle/gems/ -name "*.o" -delete

#COPY entrypoint.sh /usr/bin/
COPY . /app/
ARG RAILS_ENV=development
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
