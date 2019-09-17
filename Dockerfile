FROM debian:jessie

RUN apt-get update && apt-get install -y \
    openssh-client autossh \
    && rm -rf /var/lib/apt/lists/*

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

CMD ["./start.sh"]
