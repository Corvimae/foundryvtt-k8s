#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: release.sh version"
  exit 1
fi

rm foundryvtt*.zip

yarn download $1

docker build -t corvimae/foundryvtt:latest .
docker push corvimae/foundryvtt:latest
kubectl apply -f foundryvtt-deployment.yaml
