FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y 
RUN apt-get update && apt-get install -y \
        build-essential \
        libpq-dev nodejs \
        libqt4-dev \
        libqtwebkit-dev
RUN mkdir /fugacious
WORKDIR /fugacious
ADD . /fugacious
RUN bin/setup
EXPOSE 3000
CMD foreman start --port 3000

