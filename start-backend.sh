#!/bin/bash

if [[ "$(docker images -q medical-backend 2> /dev/null)" != "" ]]; then
  # remove existing containers
  docker rm medical-backend --force
  
  # remove existing images
  docker rmi medical-backend
fi

docker build -t medical-backend src/backend/Medical.Examination
docker run -p 8000:80 -p 8443:443 --name medical-backend -d medical-backend