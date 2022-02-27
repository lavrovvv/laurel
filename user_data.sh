#! /bin/bash
set -x 
sudo yum install docker -y
sudo service docker start
sudo docker run -d --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log.txt 
sudo docker run -d --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log2.txt
sudo docker run -d --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log3.txt
sudo docker run -d --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log4.txt
sudo docker run -d --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log5.txt
sudo docker run -d --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log6.txt
sudo docker run -d --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log7.txt
sudo docker run -d --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log8.txt
sudo docker run -d --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log9.txt
sudo docker run -d --rm alpine/bombardier -c 10000 -d 600s -l IP:PORT/TYPE >> /home/ec2-user/log10.txt
sudo shutdown now