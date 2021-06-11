#!/bin/bash

VERSION="20210602"
PROTOCOL="flobox"

docker run --rm --name flextesa-sandbox --detach -p 20000:20000 \
       tqtezos/flextesa:${VERSION} ${PROTOCOL} start

echo "Sleeping for 5s..."
sleep 5

tezos-client config reset
tezos-client --endpoint http://localhost:20000 bootstrapped
tezos-client --endpoint http://localhost:20000 config update

tezos-client import secret key alice unencrypted:edsk3QoqBuvdamxouPhin7swCvkQNgq4jP5KZPbwWNnwdZpSpJiEbq --force
tezos-client import secret key bob unencrypted:edsk3RFfvaFaxbHx8BMtEW1rKQcPtDML3LXjNqMNLCzC3wLC1bWbAt --force

echo "Sandbox set up."

#tezos-client get balance for alice
#tezos-client get balance for bob

