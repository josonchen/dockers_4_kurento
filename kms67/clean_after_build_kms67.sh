#clean_after_build_kms67.sh

cd /app/kms-omni-build

PACKAGES=(
  # KMS main components + extra modules
  '^(kms|kurento).*'

  # Kurento external libraries
  ffmpeg
  '^gir1.2-gst.*1.5'
  gir1.2-nice-0.1
  '^(lib)?gstreamer.*1.5.*'
  '^lib(nice|s3-2|srtp|usrsctp).*'
  '^srtp-.*'
  '^openh264(-gst-plugins-bad-1.5)?'
  '^openwebrtc-gst-plugins.*'

  # System development libraries
  '^libboost-?(filesystem|log|program-options|regex|system|test|thread)?-dev'
  '^lib(glib2.0|glibmm-2.4|opencv|sigc++-2.0|soup2.4|ssl|tesseract|vpx)-dev'
  uuid-dev
)

# Run a loop over all package names and uninstall them.
for PACKAGE in "${PACKAGES[@]}"; do
  sudo apt-get -yqq purge --auto-remove "$PACKAGE" || { echo "Skip unexisting"; }
done