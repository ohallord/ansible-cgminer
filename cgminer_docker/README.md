# cgminer

## Enviroment Variables passed in to Docker container

MINER_USER = <your.email@address.com>
MINER_PASSWD = worker1
worker1 --> will work for use with slushpool.com
POOL_URL --> stratum+tcp://us-east.stratum.slushpool.com:3333

docker run -dti --restart=on-failure:10 -e "MINER_USER=user@email.com" -e "MINER_PASSWD=worker1" -e "POOL_URL=stratum+tcp://us-east.stratum.slushpool.com:3333" ohallord/cgminer
