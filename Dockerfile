# vim:set ft=dockerfile:
FROM alpine:latest

MAINTAINER Andrius Kairiukstis <andrius@kairiukstis.com>

RUN apk update \
&& apk add ruby \
&& apk add --virtual build-dependencies \
           build-base \
           ruby-dev \
           ca-certificates \
           libressl \
           libressl-dev \
\
&& gem install --no-rdoc --no-ri \
               sinatra \
               json \
\
&& gem cleanup \
&& apk del build-dependencies \
&& rm -rf /usr/lib/ruby/gems/*/cache/* \
          /var/cache/apk/* \
          /tmp/* \
          /var/tmp/*

ADD server.rb /server.rb
ADD docker-entrypoint.sh /

EXPOSE 8000

ENTRYPOINT ["/docker-entrypoint.sh"]
