#!/bin/bash

echo "Building docker-clock"
docker build -t docker-clock .

echo "Running docker-clock"
docker run --rm docker-clock