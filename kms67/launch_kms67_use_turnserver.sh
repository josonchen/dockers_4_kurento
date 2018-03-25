#launch_kms67_use_turnserver.sh
# can process with or without parameter
if [ $# -ge 3 ] ; then 
	echo $1
	echo $2
	echo $3

	stunServerAddress=$1
	stunServerPort=$2
	turnURL=$3

	echo $stunServerAddress
	echo $stunServerPort
	echo $turnURL

	# backup the original ini file
	if [ ! -f /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini_original ]
	then
	    cp /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini  /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini_original
	fi

	echo "
		stunServerAddress="$stunServerAddress"
		stunServerPort="$stunServerPort"
		turnURL="$turnURL"	" | tee /etc/kurento/modules/kurento/WebRtcEndpoint.conf.ini

    #exit 1; 
	echo "
		stunServerAddress="$stunServerAddress"
		stunServerPort="$stunServerPort"
		turnURL="$turnURL"	" 

fi

export GST_DEBUG='3,Kurento*:4,kms*:4,rtpendpoint:4,webrtcendpoint:4'

cd /app/kms-omni-build/build-Debug

kurento-media-server/server/kurento-media-server \
  --modules-path=. \
  --modules-config-path=./config \
  --conf-file=./config/kurento.conf.json \
  --gst-plugin-path=. \
  > /app/kuremto.log
