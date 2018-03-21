#!/bin/bash -x
set -e

#echo $1
#echo $2
#echo $3

KMS_STUN_IP="$1"
KMS_STUN_PORT="$2"
KMS_TURN_URL="$3"

if [ -n "$KMS_TURN_URL" ]; then
  echo "turnURL=$KMS_TURN_URL" > /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
  echo "turnURL=$KMS_TURN_URL" 
fi

if [ -n "$KMS_STUN_IP" -a -n "$KMS_STUN_PORT" ]; then
  # Generate WebRtcEndpoint configuration
  echo "stunServerAddress=$KMS_STUN_IP" > /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
  echo "stunServerPort=$KMS_STUN_PORT" >> /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini
  echo "stunServerAddress=$KMS_STUN_IP" 
  echo "stunServerPort=$KMS_STUN_PORT"
fi

# Remove ipv6 local loop until ipv6 is supported
#cat /etc/hosts | sed '/::1/d' | tee /etc/hosts > /dev/null


cat  /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini


export GST_DEBUG='3,Kurento*:4,kms*:4,rtpendpoint:4,webrtcendpoint:4'

cd /app/build-Debug


echo "kurento-media-server server  will run. stunServerAddress= "$1"  stunServerPort= "$2" turnURL= "$3" "

#echo "kurento-media-server server running. stunServerAddress= "$KMS_STUN_IP"  stunServerPort= "$KMS_STUN_PORT" turnURL= "$KMS_TURN_URL" "


kurento-media-server/server/kurento-media-server \
  --modules-path=. \
  --modules-config-path=./config \
  --conf-file=./config/kurento.conf.json \
  --gst-plugin-path=.

# echo "kurento-media-server server running. stunServerAddress= "$1"  stunServerPort= "$2" turnURL= "$3" "

echo "kurento-media-server server running. stunServerAddress= "$KMS_STUN_IP"  stunServerPort= "$KMS_STUN_PORT" turnURL= "$KMS_TURN_URL" "
