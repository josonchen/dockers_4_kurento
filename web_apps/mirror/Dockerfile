FROM ubuntu:16.04
MAINTAINER joson chen <josonchen@sina.com>
ENV REFRESHED_AT 20180325

# docker pull registry.cn-hangzhou.aliyuncs.com/joson/mirror

RUN apt-get -yqq update

RUN apt-get -yqq install  git default-jdk maven 

RUN mkdir -p /app/web_apps/mirror

WORKDIR      /app/web_apps/mirror

COPY ./build_mirror.sh /app/web_apps/mirror/build_mirror.sh

RUN chmod +x  /app/web_apps/mirror/build_mirror.sh

RUN /bin/bash /app/web_apps/mirror/build_mirror.sh

EXPOSE 8443


WORKDIR  /app/web_apps/kurento-tutorial-java/kurento-magic-mirror

# only run ,compile completed in /app/web_apps/mirror/build_mirror.sh

#ENTRYPOINT ["mvn","compile","exec:java"]
ENTRYPOINT ["mvn","exec:java"]


# 0.pre   : docker ps -a 
# 1.clean : docker stop a0ddddf1952a && docker rm a0ddddf1952a && docker rmi registry.cn-hangzhou.aliyuncs.com/joson/mirror && docker run -d -p 8443:8443 --name mirror --restart=always registry.cn-hangzhou.aliyuncs.com/joson/mirror -Dkms.url=ws://192.168.2.90:8008/kurento -Dapp.server.url=https://192.168.2.90:8443

# docker run -d -p 8443:8443 --name mirror --restart=always registry.cn-hangzhou.aliyuncs.com/joson/mirror -Dkms.url=ws://192.168.2.90:8008/kurento -Dapp.server.url=https://192.168.2.90:8443

# cd /app/web_apps/kurento-tutorial-java/kurento-magic-mirror
#  mvn compile exec:java  -Dkms.url=ws://167.99.63.103:8888/kurento -Dapp.server.url=https://167.99.63.103:8443
#  docker run -d -p 8443:8443 --name mirror --restart=always joson/magic-mirror -Dkms.url=ws://167.99.63.103:8888/kurento -Dapp.server.url=https://167.99.120.:8443

#  docker run -d -p 8443:8443 --name mirror  joson/magic-mirror -Dkms.url=ws://167.99.63.103:8888/kurento -Dapp.server.url=https://167.99.63.103:8443

# docker run -i -t -p 8443:8443 --name mirror  joson/magic-mirror /bin/bash
# docker build -t="joson/magic-mirror" .