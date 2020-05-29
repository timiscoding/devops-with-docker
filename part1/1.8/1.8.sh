#!/bin/bash
touch logs.txt
docker run -v $(pwd)/logs.txt:/usr/app/logs.txt --rm devopsdockeruh/first_volume_exercise