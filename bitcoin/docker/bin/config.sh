#!/bin/bash

# Ports for RPC used by lnd
export RPCPORT0=10109
export RPCPORT1=11109
export RPCPORT2=12109
export RPCPORT3=13109

# Ports to which RPC is forwarded using ssh.
# lnd listens on localhost so to allow access from external word we need port forwarding
export RPCPORT0EXT=10009
export RPCPORT1EXT=11009
export RPCPORT2EXT=12009
export RPCPORT3EXT=13009

export PEERPORT0=10011
export PEERPORT1=11011
export PEERPORT2=12011
export PEERPORT3=13011

# Set default variables if needed.
export RPCUSER="devuser"
export RPCPASS="devpass"
export DEBUG="info"
export BITCOIN_NETWORK="simnet"

# Initial balances for nodes
# This amount is satoshis will be sent to each node excluding wallet
export STARTBALANCE=1000000000000

# Capacity of opening lighning channels
export CHANNELSIZE=2000000
# How much money should be push to other party on channel opening
# Balances will be (approximately):
# for opening party: $CHANNELSIZE-$PUSHAMOUNT
# for other party: $PUSHAMOUNT
export PUSHAMOUNT=1000000