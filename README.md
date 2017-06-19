Simple simnet environment for LND

[LND](https://github.com/LightningNetwork/lnd) is Lightning Network Daemon

Sometimes you need a small working lnd network to test some stuff. This project is created for this.
1. Choose network that you want and go in respective folder.
  
    1.1 If you want bitcoin
  
    `$ cd bitcoin`

    1.2 OR if you want litecoin
  
    `$ cd litecoin`

2. Build it
   
   `$ ./build.sh`
3. Start it
   
   `$ ./ start.sh`
   
And you have docker container with 3 lnd running within it, with opened channels.