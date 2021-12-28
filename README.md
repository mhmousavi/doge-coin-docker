# doge-coin-docker

docker-compose build
docker-compose up -d


you can use this command to open docker container and use dogecoin-cli :
sudo bash open-cli.sh 

take look at block_chain_info.sh to see rpc request structure

configure dogecoin on dogecoin.conf file 

select dogecoin version on Dockerfile line 11

this container volume the blocks data on directory data alongside other files

create your own rpcauth and password to protect your dogecoin full node

