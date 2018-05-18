FROM ruby:2.3.1-alpine

# Install system dependencies
RUN set -ex; \
    apk add --no-cache --update \ 
        ca-certificates \
        linux-headers \
        build-base \
        libxml2-dev \
        libxslt-dev \
        mariadb-dev \
        tzdata \
        nodejs \
    && rm -rf /var/cache/apk/* \
    && node -v

# Install ruby bundler
RUN set -ex; \
    gem install bundler \
    && bundle version \
    && bundle config --global frozen 1

# Build app
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

# Run app
COPY docker-entry.sh /
RUN chmod +x /docker-entry.sh
ENTRYPOINT [ "/docker-entry.sh" ]

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
