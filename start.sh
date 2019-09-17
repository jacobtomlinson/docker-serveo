#!/bin/bash

if ! [ -z "$DOMAIN" ]
then
      DOMAIN="$DOMAIN:"
fi

echo "Setting up forwarding from $SERVEO_HOST to $LOCAL_HOST:$LOCAL_PORT"

autossh -M 0 \
    -oServerAliveInterval=$SERVER_ALIVE_INTERVAL \
    -oServerAliveCountMax=$SERVER_ALIVE_COUNT_MAX \
    -oStrictHostKeyChecking=no \
    -oUserKnownHostsFile=/dev/null \
    -R $DOMAIN$REMOTE_PORT:$LOCAL_HOST:$LOCAL_PORT \
    $SERVEO_HOST