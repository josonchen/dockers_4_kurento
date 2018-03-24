FROM ubuntu:16.04
MAINTAINER joson chen <josonchen@sina.com>
ENV REFRESHED_AT 20180324


#sudo docker pull registry.cn-hangzhou.aliyuncs.com/joson/kms67

RUN apt-get -yqq update
ENV DISTRO xenial 

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5AFA7A83

ADD  kurento.list /etc/apt/sources.list.d/kurento.list

#Install development packages

RUN apt-get -yqq update  && apt-get install -qqy   \
  build-essential \
  cmake \
  debhelper \
  default-jdk \
  gdb \
  git \
  maven \
  pkg-config \
  valgrind \
  wget \
  maven-debian-helper- \
  libboost-dev \
  libboost-filesystem-dev \
  libboost-log-dev \
  libboost-program-options-dev \
  libboost-regex-dev \
  libboost-system-dev \
  libboost-test-dev \
  libboost-thread-dev \
  libevent-dev \
  libglib2.0-dev \
  libglibmm-2.4-dev \
  libopencv-dev \
  libsigc++-2.0-dev \
  libsoup2.4-dev \
  libssl-dev \
  libvpx-dev \
  libxml2-utils \
  uuid-dev \
  gstreamer1.5-plugins-base \
  gstreamer1.5-plugins-good \
  gstreamer1.5-plugins-ugly \
  gstreamer1.5-plugins-bad \
  gstreamer1.5-libav \
  gstreamer1.5-nice \
  gstreamer1.5-tools \ 
  gstreamer1.5-x \
  libgstreamer1.5-dev \
  libgstreamer-plugins-base1.5-dev \
  libnice-dev \
  openh264-gst-plugins-bad-1.5 \
  openwebrtc-gst-plugins-dev \
  kmsjsoncpp-dev \
  ffmpeg 

#install the debugging symbols if you will be using a debugger to troubleshoot bugs in KMS

RUN apt-get -yqq update  && apt-get -yqq install \
  libglib2.0-0-dbg \
  libssl1.0.0-dbg \
  gstreamer1.5-plugins-base-dbg \
  gstreamer1.5-plugins-good-dbg \
  gstreamer1.5-plugins-ugly-dbg \
  gstreamer1.5-plugins-bad-dbg \
  gstreamer1.5-libav-dbg \
  libgstreamer1.5-0-dbg \
  libnice-dbg \
  libsrtp1-dbg \
  openwebrtc-gst-plugins-dbg \
  kmsjsoncpp-dbg \
  kms-jsonrpc-dbg \
  kms-core-dbg \
  kms-elements-dbg \
  kms-filters-dbg \
  kurento-media-server-dbg \
  kms-chroma-dbg \
  kms-crowddetector-dbg \
  kms-platedetector-dbg \
  kms-pointerdetector-dbg 

COPY ./build_kms67.sh /build_kms67.sh
RUN chmod +x /build_kms67.sh
RUN /build_kms67.sh


