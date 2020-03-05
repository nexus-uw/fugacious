FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y 
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -y nodejs
#note: see if these can be cleaned later
RUN apt-get update && apt-get install -y \
        build-essential \
        libpq-dev \
        libqt4-dev \
        libqtwebkit-dev
RUN mkdir /fugacious
WORKDIR /fugacious
ADD . /fugacious
RUN bin/setup
EXPOSE 3000

ENV REDIS_URL=redis://redis
ENV WEB_CONCURRENCY=1
ENV RAILS_MAX_THREADS=1
ENV RACK_ENV=production
ENV APP_NAME=fugacious
ENV MAX_RETENTION_HOURS=24
ENV SECRET_KEY_BASE=f96a2462114e5687c02ee262895f4d3c556d9dbacc5aaf54ea33da31a84970eade80ae9ed4becb5305bdffea1524725a3f09269a496bbe4f90698ccc4ae15e92

CMD foreman start --port 3000

