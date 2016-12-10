# vim:set ft=dockerfile:
FROM gliderlabs/alpine:3.4

MAINTAINER Andrius Kairiukstis <andrius@kairiukstis.com>

RUN apk --update add ruby openssl ca-certificates \
&&  gem install sinatra --no-rdoc --no-ri \
&&  gem clean \
&&  apk del openssl ca-certificates \
&&  rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

ADD server.rb /server.rb
ADD docker-entrypoint.sh /

EXPOSE 8000

ENTRYPOINT ["/docker-entrypoint.sh"]

