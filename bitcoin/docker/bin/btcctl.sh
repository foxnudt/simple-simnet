#!/bin/bash -e

. /simnet/bin/config.sh

btcctl \
        "--$BITCOIN_NETWORK" \
        --rpccert="/simnet/rpc/rpc.cert" \
        --rpcuser="$RPCUSER" \
        --rpcpass="$RPCPASS" \
        --rpcserver="localhost" \
        "$@"