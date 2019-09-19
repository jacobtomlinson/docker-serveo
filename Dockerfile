FROM alpine:3

RUN apk --no-cache add autossh bash tini

ADD start.sh .

# Port forward settings
ENV LOCAL_HOST 0.0.0.0
ENV LOCAL_PORT 8080
ENV REMOTE_PORT 80
ENV DOMAIN ''

# Connection settings
ENV SERVEO_HOST serveo.net
ENV SERVER_ALIVE_INTERVAL 30
ENV SERVER_ALIVE_COUNT_MAX 3

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["./start.sh"]
