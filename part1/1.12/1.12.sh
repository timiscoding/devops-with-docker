#!/bin/bash
docker build -t frontend-example-docker -f fe.Dockerfile .
docker build -t backend-example-docker -f be.Dockerfile .

docker run --rm -p 5000:5000 frontend-example-docker
docker run --rm -p 8000:8000 backend-example-docker