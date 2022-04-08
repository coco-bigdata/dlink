```shell
sudo docker-compose build
sudo docker-compose down
sudo docker-compose up
sudo docker-compose up -d

sudo docker-compose build database
sudo docker-compose build dinky-server
sudo docker-compose build dinky-web

sudo docker-compose up database
sudo docker-compose up -d database
sudo docker-compose stop database
sudo docker-compose rm database

sudo docker-compose up dinky-server
sudo docker-compose up -d dinky-server
sudo docker-compose stop dinky-server
sudo docker-compose rm dinky-server

sudo docker-compose up dinky-web
sudo docker-compose up -d dinky-web
sudo docker-compose stop dinky-web
sudo docker-compose rm dinky-web
```