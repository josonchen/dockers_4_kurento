echo $1
echo $2
echo $3

stunServerAddress=$1
stunServerPort=$2
turnURL=$3

# backup the original ini file

if [ -f /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini_original ]
then
    cp /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini_original
fi

echo \"
stunServerAddress=\"$stunServerAddress\"
stunServerPort=\"$stunServerPort\"
turnURL=\"$turnURL\"

\"| tee /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini


export GST_DEBUG='3,Kurento*:4,kms*:4,rtpendpoint:4,webrtcendpoint:4'

cd /app/kms-omni-build/build-Debug

kurento-media-server/server/kurento-media-server \
  --modules-path=. \
  --modules-config-path=./config \
  --conf-file=./config/kurento.conf.json \
  --gst-plugin-path=. \
  > /app/kuremto.log
