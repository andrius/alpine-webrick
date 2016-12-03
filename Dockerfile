# vim:set ft=dockerfile:
FROM gliderlabs/alpine:3.4

MAINTAINER Andrius Kairiukstis <andrius@kairiukstis.com>

WORKDIR /web

RUN apk --update add ruby \
&&  touch /web/index.html \
&&  rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

EXPOSE 8000

ENTRYPOINT ["ruby", "-rwebrick", "-e", "WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start"]

