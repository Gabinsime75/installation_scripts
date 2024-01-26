#!/bin/bash
sudo apt update -y

sudo apt install docker.io -y
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl start docker
sudo systemctl enable docker

#sudo chmod 777 /var/run/docker.sock
