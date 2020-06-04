#!/bin/bash

docker build -t spring-example-project .
docker run --rm -p 8080:8080 spring-example-project