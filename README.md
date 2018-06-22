# CGMINER Docker and Ansible 
This project will build and deploy a docker image to an EC2 instance. 
 * Builds a [CGMiner](https://github.com/ckolivas/cgminer) Docker image
 * Pushes docker image to [Docker Hub](https://hub.docker.com/r/ohallord/cgminer/)
 * Uses Circle CI to build and deploy this to an AWS EC2 Instance.
 
 ## Ansible is used to build and deploy.
 * Using [Ansible 2.5](https://docs.ansible.com/ansible/2.5/roadmap/ROADMAP_2_5.html) 
 * Use [docker_image](https://docs.ansible.com/ansible/2.5/modules/docker_image_module.html?highlight=docker_image)
 * Use [docker_container](https://docs.ansible.com/ansible/2.5/modules/docker_container_module.html?highlight=docker_container)
 
 ## Docker
 * Docker stuff is located in cgminer_docker sub-directory
 
 ## Circle Ci Environment Variables
 
 * **DOCKER_PASSWORD** Your Docker hub user name
 * **DOCKER_USERNAME** Your Docker hub user password
 * **EC2_HOST_IP** The IP address for your ec2 instance.
 * **MINER_PASSWD** Can be anything this example is using [slushpool.com](https://slushpool.com)
 * **MINER_USER** Your [slushpool.com](https://slushpool.com) email address
 * **POOL_URL** The [slushpool.com](https://slushpool.com) pool address for the coin you are trying to mine.
   * i.e. stratum+tcp://us-east.stratum.slushpool.com:3333
 * **SSH_FINGERPRINT** The ec2 SSH Key file you loaded to your Circle CI account
 * **SSH_KEY_NAME** This will be the finger print with out the Colons (:) it is use to find the id_rsa file
   * It will find this /home/circleci/.ssh/id_rsa_877ad7a80e1711c6cf9ac502e48b7788 
 

## Calling the ansible commands locally
* Build/Push:
  * ansible-playbook build_cgminer_docker_file.yml
* Deploy:
  * ansible-playbook -i  ~/repo/hosts deploy_docker.yml --extra-vars "POOL_URL=$POOL_URL MINER_USER=$MINER_USER  MINER_PASSWD=$MINER_PASSWD"
  
## Additonal Ansible Playbooks
* Create an EC2 instance
  * shapeshift_ec2_instance.yml
* Boot Strap Bare ec2 instance
  * ansible_bootstrap-ubunu-16.04.yml