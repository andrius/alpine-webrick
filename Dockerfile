# vim:set ft=dockerfile:
FROM alpine:latest

MAINTAINER Andrius Kairiukstis <andrius@kairiukstis.com>

RUN apk --update add ruby \
                     libressl \
                     ca-certificates \
&& gem install --no-rdoc --no-ri sinatra \
&& gem clean \
&& rm -rf /usr/lib/ruby/gems/*/cache/* \
&& apk del openssl ca-certificates \
&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

ADD server.rb /server.rb
ADD docker-entrypoint.sh /

EXPOSE 8000

ENTRYPOINT ["/docker-entrypoint.sh"]
