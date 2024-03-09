FROM alpine:latest AS build

RUN apk add --no-cache nodejs npm
RUN npm install -g --unsafe-perm node-red


FROM alpine:latest
WORKDIR /app

ENV USER_UID=
ENV USER_GID=
EXPOSE 8080
VOLUME /data

COPY docker .
COPY --from=build /usr/local /usr/local
RUN apk add --no-cache tini nodejs

CMD ["/sbin/tini", "--", "/app/run.sh"]