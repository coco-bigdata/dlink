# stage 0, 引入plugins
FROM maven:3.8.4-jdk-8 as plugin-stage
WORKDIR /app
# https://mirrors.cloud.tencent.com/apache/flink
# https://mirrors.aliyun.com/apache/flink/
# wget https://mirrors.cloud.tencent.com/apache/flink/flink-1.13.6/flink-1.13.6-bin-scala_2.12.tgz
ADD flink-1.13.3-bin-scala_2.12.tgz /tmp
RUN tar zxvf /tmp/flink-1.13.3-bin-scala_2.12.tgz -C /app --strip-components=1


# stage 1, build stage
FROM maven:3.8.4-jdk-8 as build-stage
WORKDIR /app
ADD . /app
RUN mkdir /tmp/dist
RUN tar zxvf ./build/dlink-release-*.tar.gz -C /tmp/dist --strip-components=1


# stage 2, production stage
FROM openjdk:8-oracle as production-stage
WORKDIR /app
RUN mkdir plugins
COPY --from=build-stage /tmp/dist /app
COPY --from=plugin-stage /app/lib /app/plugins


CMD [ "/bin/sh", "-c", "java -Dloader.path=./lib,./plugins -Ddruid.mysql.usePingMethod=false -jar -Xms512M -Xmx2048M ./dlink-admin-*.jar" ]
