#!/bin/bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 068465305139.dkr.ecr.us-east-1.amazonaws.com
docker pull 170015466808.dkr.ecr.us-west-2.amazonaws.com/dlee533/pywebapp:latest || {
    echo "ERROR: docker pull failed. Sleeping for 10 minutes to allow investigation..."
    sleep 600
    exit 1
}
docker run --name pywebapp -p 80:8080 --detach 170015466808.dkr.ecr.us-west-2.amazonaws.com/dlee533/pywebapp:latest
