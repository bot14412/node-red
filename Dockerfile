FROM alpine:latest
WORKDIR /app

ENV PORT=
ENV USER_UID=
ENV USER_GID=
EXPOSE 8080
VOLUME /data

COPY docker .
RUN apk add --no-cache tini nodejs npm
RUN npm install -g --unsafe-perm node-red

CMD ["/sbin/tini", "--", "/app/run.sh"]