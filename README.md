Webrick server
==============

I had to test app that push live data to the API and as result have created this docker image.

It is simple ruby webrick server that listen on port 8000 and print out log of each request.

It also could work as small HTTP server, serving *html files -- just mount them to the /web folder!

Sample `docker-compose.yml` file:

```
webrick:
  image: andrius/webrick:latest
  ports:
    - 8000/tcp:8000/tcp
  volumes:
    - "./index.html:/web/index.html"
```

Reference:

[https://gist.github.com/willurd/5720255](https://gist.github.com/willurd/5720255)

