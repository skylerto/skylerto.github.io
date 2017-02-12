FROM envygeeks/alpine
MAINTAINER Skyler Layne <skylerclayne@gmail.com>
FROM nginx
COPY _site/ /usr/share/nginx/html
