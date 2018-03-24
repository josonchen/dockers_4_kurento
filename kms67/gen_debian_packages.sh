#gen_debian_packages.sh
#Generating Debian packages
#Install system tools and Python modules.

cd /app

# 1.(Optional) Make sure the system is in a clean state. The section :ref:`dev-clean` explains how to do this.

# 2.(Optional) Add Kurento Packages Repository. The section about :ref:`Dependency resolution <dev-depresolution>` explains what is the effect of adding the repo, and the section :ref:`dev-repository` explains how to do this.

# 3.Install system tools and Python modules. Run:

PACKAGES=(
  # Packaging tools
  build-essential
  debhelper
  curl
  fakeroot
  flex
  git
  libcommons-validator-java
  python
  python-apt
  python-debian
  python-git
  python-requests
  python-yaml
  realpath
  subversion
  wget
)

sudo apt-get -yqq update
sudo apt-get -yqq install "${PACKAGES[@]}"

# 4.Download the Kurento CI tools. Run:

cd /app

git clone https://github.com/Kurento/adm-scripts.git
export PATH="$PWD/adm-scripts:$PATH"

# 5.Download and build packages for the desired module. Run:
cd /app

git clone https://github.com/Kurento/kms-core.git
cd kms-core
sudo PATH="$PWD/../adm-scripts:$PATH" PYTHONUNBUFFERED=1 \
  ../adm-scripts/kms/compile_project.py \
  --base_url https://github.com/Kurento compile

