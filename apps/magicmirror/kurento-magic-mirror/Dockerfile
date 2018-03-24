FROM ubuntu:16.04
MAINTAINER joson chen <josonchen@sina.com>
ENV REFRESHED_AT 20180325

RUN apt-get -yqq update

RUN apt-get -yqq install  default-jdk maven 

RUN mkdir /app
WORKDIR /app

COPY ./build_mirror.sh /app/build_mirror.sh
RUN chmod +x /app/build_mirror.sh
RUN /bin/bash /app/build_mirror.sh

EXPOSE 8443 

ENTRYPOINT ["mvn", "compile", "exec:java"]

#  mvn compile exec:java  -Dkms.url=ws://167.99.63.103:8888/kurento -Dapp.server.url=https://167.99.63.103:8443
#  docker run -d -p 8443:8443 --name mirror --restart=always joson/magic-mirror -Dkms.url=ws://167.99.63.103:8888/kurento -Dapp.server.url=https://167.99.63.103:8443

#  docker run -d -p 8443:8443 --name mirror  joson/magic-mirror -Dkms.url=ws://167.99.63.103:8888/kurento -Dapp.server.url=https://167.99.63.103:8443

# docker run -i -t -p 8443:8443 --name mirror  joson/magic-mirror /bin/bash
# docker build -t="joson/magic-mirror" .