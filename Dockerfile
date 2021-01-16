FROM ruby:3-alpine
COPY . /api-cucumber-V5
COPY . /api-cucumber-V5
WORKDIR /api-cucumber-V5
RUN apk update
RUN apk add build-base \
    curl \
    curl-dev \
    libcurl \
    libpq \
    libxml2-dev \
    libxslt-dev \
    openjdk8 \
    postgresql-dev \ 
    ruby-nokogiri --no-cache
RUN apk add --no-cache py-pip
RUN apk add pkgconfig imagemagick6 imagemagick6-dev imagemagick6-libs
RUN apk --no-cache add msttcorefonts-installer fontconfig && update-ms-fonts && fc-cache -f

RUN pip install awscli
RUN apk add vim
RUN apk add bash
RUN apk add git

RUN curl -o allure-2.7.0.tgz -Ls https://dl.bintray.com/qameta/generic/io/qameta/allure/allure/2.7.0/allure-2.7.0.tgz
RUN tar -zxvf allure-2.7.0.tgz -C /opt/
RUN ln -s /opt/allure-2.7.0/bin/allure /usr/bin/allure

RUN apk add --no-cache tzdata
ENV TZ America/Sao_Paulo

RUN gem install bundler
RUN chmod 777 -R /api-cucumber-V5
