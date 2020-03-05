FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y 
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -y nodejs
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
CMD foreman start --port 3000

