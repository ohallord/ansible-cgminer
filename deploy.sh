#!/bin/bash


echo "Going to deploy docker container using ansible"
env


ansible-playbook create_host_file.yml --extra-vars "HOST_IP=$SERVER_IP_ADDRESS SSH_KEY_NAME=cgminer"
echo "The Server IP is  $SERVER_IP_ADDRESS"
echo "The host file is"
cat ./hosts
ansible-playbook -i ./hosts deploy_docker.yml --extra-vars "POOL_URL=$POOL_URL MINER_USER=$MINER_USER  MINER_PASSWD=$MINER_PASSWD"


