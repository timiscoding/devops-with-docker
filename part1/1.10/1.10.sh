#!/bin/bash

docker build -t frontend-example-docker .
docker run --rm -p 5000:5000 frontend-example-docker