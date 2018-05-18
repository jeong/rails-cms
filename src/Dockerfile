FROM ruby:2.3.1-alpine

RUN apk add --no-cache --update \ 
    ca-certificates \
    build-base \
    libxml2-dev \
    libxslt-dev \
    mariadb-dev \
    && rm -rf /var/cache/apk/*

RUN gem install bundler && \
    bundle config --global frozen 1

WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
