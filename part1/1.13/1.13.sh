#!/bin/bash
# 15-alpine: 190MB
# 15: 613MB
git clone git@github.com:docker-hy/spring-example-project.git

# use cloned dir as docker context
docker build -t spring-example-project -f Dockerfile spring-example-project
docker run --rm -p 8080:8080 spring-example-project