#install_development_packages_kms67.sh

# Add Kurento repository
# Choose one:
# DISTRO="trusty"  # KMS for Ubuntu 14.04 (Trusty)
DISTRO="xenial"  # KMS for Ubuntu 16.04 (Xenial)
cd /app

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5AFA7A83

sudo tee "/etc/apt/sources.list.d/kurento.list" >/dev/null <<EOF
# Kurento Media Server - Pre-Release packages
deb [arch=amd64] http://ubuntu.openvidu.io/dev $DISTRO kms6
EOF

# Install development packages

PACKAGES=(
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

sudo apt-get -yqq update
sudo apt-get -yqq install "${PACKAGES[@]}"

#install the debugging symbols if you will be using a debugger to troubleshoot bugs in KMS
# PACKAGES=(
#   # Third-party libraries
#   libglib2.0-0-dbg
#   libssl1.0.0-dbg
# 
#   # Kurento external libraries
#   gstreamer1.5-plugins-base-dbg
#   gstreamer1.5-plugins-good-dbg
#   gstreamer1.5-plugins-ugly-dbg
#   gstreamer1.5-plugins-bad-dbg
#   gstreamer1.5-libav-dbg
#   libgstreamer1.5-0-dbg
#   libnice-dbg
#   libsrtp1-dbg
#   openwebrtc-gst-plugins-dbg
#   kmsjsoncpp-dbg
# 
#   # KMS main components
#   kms-jsonrpc-dbg
#   kms-core-dbg
#   kms-elements-dbg
#   kms-filters-dbg
#   kurento-media-server-dbg
# 
#   # KMS extra modules
#   kms-chroma-dbg
#   kms-crowddetector-dbg
#   kms-platedetector-dbg
#   kms-pointerdetector-dbg
# )
# 
# sudo apt-get update
# sudo apt-get install "${PACKAGES[@]}"

