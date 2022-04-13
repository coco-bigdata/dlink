```shell
cd dlink-web
# sudo docker run -ti --privileged --volume="$(pwd)":/dlink-web -v $(pwd)/root:/root --rm node:16 bash
sudo docker run -ti --privileged --volume="$(pwd)":/dlink-web -v $(pwd)/root:/root --rm node:14 bash
cd /dlink-web
npm install -g cnpm --registry=https://registry.npm.taobao.org
cnpm install
# npm install
npm run build

cd ../
mvn clean package -Dmaven.test.skip=true

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

jdbc:mysql://172.21.16.11:3307

tar -zxvf flink-1.13.6-bin-scala_2.12.tgz
cd flink-1.13.6/
vim conf/flink-conf.yaml
bin/start-cluster.sh
bin/stop-cluster.sh

http://49.232.6.131:8087/

sudo docker rmi `docker images | grep none | awk '{print $3}'`

http://www.dlink.top/#/zh-CN/introduce
```

```xml
<execution>
    <id>install node and npm</id>
    <goals>
      <goal>install-node-and-npm</goal>
    </goals>
</execution>
<execution>
    <id>npm install</id>
    <goals>
      <goal>npm</goal>
    </goals>
    <configuration>
      <!-- 国内npm源加速可在后面加入(去掉空格) - -registry https://repo.huaweicloud.com/repository/npm/ -->
      <arguments>install --force</arguments>
    </configuration>
</execution>
<execution>
    <id>npm run build</id>
    <goals>
        <goal>npm</goal>
    </goals>
    <configuration>
        <arguments>run build</arguments>
    </configuration>
</execution>
```