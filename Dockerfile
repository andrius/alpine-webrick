# vim:set ft=dockerfile:
FROM andrius/alpine-ruby:latest

LABEL maintainer="Andrius Kairiukstis <k@andrius.mobi>"

RUN apk add --update --virtual .build-dependencies \
            build-base \
            ruby-dev \
\
&& gem install --no-rdoc --no-ri \
               webrick \
               sinatra \
\
&& gem cleanup \
&& apk del .build-dependencies \
&& rm -rf /usr/lib/ruby/gems/*/cache/* \
          /var/cache/apk/* \
          /tmp/* \
          /var/tmp/*

ADD server.rb /server.rb
ADD docker-entrypoint.sh /

EXPOSE 8000

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/ruby", "-rsinatra", "/server.rb"]
