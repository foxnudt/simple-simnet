#!/bin/bash -e

. /simnet/bin/config.sh

ltcctl \
        "--$LITECOIN_NETWORK" \
        --rpccert="/simnet/rpc/rpc.cert" \
        --rpcuser="$RPCUSER" \
        --rpcpass="$RPCPASS" \
        --rpcserver="localhost" \
        "$@"