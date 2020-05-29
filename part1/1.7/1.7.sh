#!/bin/bash

docker build -t curler .
docker run -it --rm curler