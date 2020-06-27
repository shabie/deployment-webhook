#! /bin/bash

echo "redeploy.sh executed"

docker stop auto-flask
docker rm auto-flask
docker pull shabie/auto-flask:latest
docker run -d --name auto-flask -p 5000:5000 shabie/auto-flask:latest
