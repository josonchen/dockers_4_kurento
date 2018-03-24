cd /app

git clone https://github.com/Kurento/kms-omni-build.git \
  && cd kms-omni-build \
  && git submodule init \
  && git submodule update --recursive --remote

cd /app/kms-omni-build
REF=master
for d in $(find . -maxdepth 1 -mindepth 1 -type d)
do pushd $d ; git checkout "$REF" ; popd ; done

cd /app/kms-omni-build
TYPE=Debug
mkdir build-$TYPE \
  && cd build-$TYPE \
  && cmake -DCMAKE_BUILD_TYPE=$TYPE -DCMAKE_VERBOSE_MAKEFILE=ON .. \
  && make