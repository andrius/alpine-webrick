# vim:set ft=dockerfile:
FROM andrius/alpine-ruby:latest

LABEL maintainer="Andrius Kairiukstis <k@andrius.mobi>"

WORKDIR /app
COPY Gemfile* ./
COPY server.rb ./

RUN apk update \
 && apk add ruby-etc \
 && apk add --virtual .build-dependencies \
            build-base \
            ruby-dev \
 && bundle update || bundle install \
 && gem cleanup \
 && apk del .build-dependencies \
 && rm -rf /usr/lib/ruby/gems/*/cache/* \
          /var/cache/apk/* \
          /tmp/* \
          /var/tmp/*

EXPOSE 8000

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bundle", "exec", "server.rb"]
