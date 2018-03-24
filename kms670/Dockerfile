FROM ubuntu:16.04
MAINTAINER joson chen <josonchen@sina.com>
ENV REFRESHED_AT 20180324

RUN apt-get -yqq update && apt-get -yqq install nginx
ENV DISTRO xenial 

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5AFA7A83

RUN tee "/etc/apt/sources.list.d/kurento.list" >/dev/null <<EOF
# Kurento Media Server - Pre-Release packages
deb [arch=amd64] http://ubuntu.openvidu.io/dev $DISTRO kms6
EOF

ENV PACKAGES (
  # Development tools
  build-essential
  cmake
  debhelper
  default-jdk
  gdb
  git
  maven
  pkg-config
  valgrind
  wget

  # 'maven-debian-helper' installs an old Maven version in Ubuntu 14.04 (Trusty),
  # so this ensures that the effective version is the one from 'maven'.
  maven-debian-helper-

  # System development libraries
  libboost-dev
  libboost-filesystem-dev
  libboost-log-dev
  libboost-program-options-dev
  libboost-regex-dev
  libboost-system-dev
  libboost-test-dev
  libboost-thread-dev
  libevent-dev
  libglib2.0-dev
  libglibmm-2.4-dev
  libopencv-dev
  libsigc++-2.0-dev
  libsoup2.4-dev
  libssl-dev
  libvpx-dev
  libxml2-utils
  uuid-dev

  # Kurento external libraries
  gstreamer1.5-plugins-base
  gstreamer1.5-plugins-good
  gstreamer1.5-plugins-ugly
  gstreamer1.5-plugins-bad
  gstreamer1.5-libav
  gstreamer1.5-nice
  gstreamer1.5-tools
  gstreamer1.5-x
  libgstreamer1.5-dev
  libgstreamer-plugins-base1.5-dev
  libnice-dev
  openh264-gst-plugins-bad-1.5
  openwebrtc-gst-plugins-dev
  kmsjsoncpp-dev
  ffmpeg
)

RUN apt-get update
RUN apt-get install "${PACKAGES[@]}"