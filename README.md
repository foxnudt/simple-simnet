Simple simnet environment for LND

[LND](https://github.com/LightningNetwork/lnd) is Lightning Network Daemon

Sometimes you need a small working lnd network to test some stuff. This project is created for this.
1. Build it
   
   $ ./build.sh
2. Start it
   
   $ ./ start.sh
   
And you have docker container with 3 lnd running within it, with opened channels.