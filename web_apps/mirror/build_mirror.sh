# build_mirror.sh

cd /app/web_apps

git clone https://github.com/Kurento/kurento-tutorial-java.git

cd /app/web_apps/kurento-tutorial-java/kurento-magic-mirror

git checkout 6.7.1

mvn compile 

# mvn compile exec:java
