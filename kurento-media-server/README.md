# Docker image for KMS server
A Docker container with the [Kurento media server](https://github.com/Kurento/kurento-media-server)

start kurento media server with:

```
sudo docker run -d -p 8888:8888 --name kms670  --restart=always joson/kurento-media-server   thestunServerAddress thestunServerPort theturnURL
```
