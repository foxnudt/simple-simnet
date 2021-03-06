#!/bin/bash -e

# Possible arguments are
# 1. No arguments. Simply start siment. Note: pubkey for nodes will be different each time
# 2. --save-init-state Start simnet and save intial state for nodes. Then exit.
# 3. --restore-init-state Start simnet and restore ints state from the save. Note: pubkeys will be the same for each run.

mkdir -p save_simnet
docker run \
  -p 10010:10010 \
  -p 11010:11010 \
  -p 12010:12010 \
  -p 13010:13010 \
  --volume ${PWD}/save_simnet:/save_simnet \
  -it \
  mkola1/simple-simnet-litecoin:0.1 "$@"

# Need to change files ownership in save_simnet
# They will have root because they were create in container by root proccess
if [ "$1" == "--save-init-state" ]; then
    sudo chown -R $(id -u):$(id -g) save_simnet
fi
