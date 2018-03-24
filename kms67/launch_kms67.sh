#run without turn-server

export GST_DEBUG='3,Kurento*:4,kms*:4,rtpendpoint:4,webrtcendpoint:4'

cd /app/kms-omni-build/build-Debug

kurento-media-server/server/kurento-media-server \
  --modules-path=. \
  --modules-config-path=./config \
  --conf-file=./config/kurento.conf.json \
  --gst-plugin-path=. \
  > /app/kuremto.log