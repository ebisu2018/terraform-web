#!/bin/bash

#cat > index.html <<EOF
#<h1>Hello World</h1>
#<p>DB address: ${db_address}</p>
#<p>DB port: ${db_port}</p>
#EOF
#
#nohup busybox httpd -f -p ${server_port} &

sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html