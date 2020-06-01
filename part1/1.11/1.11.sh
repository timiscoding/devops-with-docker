#!/bin/bash

docker build -t backend-example-docker .
touch logs.txt
docker run --rm -p 8000:8000 -v $(pwd)/logs.txt:/backend-example-docker/logs.txt backend-example-docker