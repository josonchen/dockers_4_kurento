FROM ubuntu:16.04
MAINTAINER joson chen <josonchen@sina.com>
ENV REFRESHED_AT 20180325

run apt-get -yqq update

run apt-get -yqq install  default-jdk maven 

###install jdk8


RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && \
    apt-get install -y --no-install-recommends oracle-java8-installer && \
rm -rf /var/lib/apt/lists/*



run mkdir /home/git

add kurento-tutorial-java/ /home/git/kurento-tutorial-java/ 

run  cd /home/git/kurento-tutorial-java/kurento-magic-mirror

workdir /home/git/kurento-tutorial-java/kurento-magic-mirror

expose 8443 

entrypoint ["mvn", "compile", "exec:java"]

#  mvn compile exec:java  -Dkms.url=ws://167.99.63.103:8888/kurento -Dapp.server.url=https://167.99.63.103:8443
#  docker run -d -p 8443:8443 --name mirror --restart=always joson/magic-mirror -Dkms.url=ws://167.99.63.103:8888/kurento -Dapp.server.url=https://167.99.63.103:8443

#  docker run -d -p 8443:8443 --name mirror  joson/magic-mirror -Dkms.url=ws://167.99.63.103:8888/kurento -Dapp.server.url=https://167.99.63.103:8443

# docker run -i -t -p 8443:8443 --name mirror  joson/magic-mirror /bin/bash
# docker build -t="joson/magic-mirror" .