FROM jekyll/jekyll:4.0 AS build

WORKDIR /srv/jekyll
COPY ./ ./

RUN jekyll build

FROM nginx:1.18 AS server
COPY --from=build /srv/jekyll/_site/ /usr/share/nginx/html
