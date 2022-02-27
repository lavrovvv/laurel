#! /bin/bash
set -x 
sudo yum install docker -y
sudo service docker start
sudo docker run -i --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log.txt 
sudo shutdown now
