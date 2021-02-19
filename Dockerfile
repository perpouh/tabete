FROM ruby:2.6.6-alpine
ENV LANG C.UTF-8

RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD . $APP_ROOT

RUN apk update \
    && apk add --update --no-cache \
      bash \
      mariadb-connector-c-dev \
      nodejs \
      tzdata \
      less \
      xz-libs \
    && apk add --update --no-cache --virtual .build-dependencies \
      build-base \
      curl-dev \
      gcc \
      g++ \
      libxml2-dev \
      libxslt-dev \
      linux-headers \
      make \
      mariadb-dev \
      ruby-dev \
      yaml-dev \
      zlib-dev \
    && bundle install -j4 \
    && apk del .build-dependencies

ARG ASSETS_PRECOMPILE=true
RUN if [ ${ASSETS_PRECOMPILE} = true ]; then \
  rake assets:precompile \
;fi

VOLUME [ "/app/public", "/app/tmp" ]
