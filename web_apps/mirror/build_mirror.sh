# build_mirror.sh

cd /app/web_apps

git clone -b  hiphop https://github.com/josonchen/kurento-tutorial-java.git

# git clone https://github.com/Kurento/kurento-tutorial-java.git

cd /app/web_apps/kurento-tutorial-java/kurento-magic-mirror

git checkout 6.7.1

# compiled ,after create the docker
mvn compile 

# mvn compile exec:java
