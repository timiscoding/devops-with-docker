# Image builder

Builds a docker image from any github repo with a Dockerfile and pushes it to docker hub

## Requirements

This image runs the docker cli only therefore it requires the docker daemon to be running on the host system.

## Usage

Build it: `docker build -t image_builder .`

Run it: `docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_LOGIN=username -e DOCKER_PASSWORD=pass image_builder https://github.com/username/repo`

IMPORTANT: The docker credentials are stored unencrypted in the container so we use `--rm` to remove the container once we're done. Since this is an exercise, this will suffice, but it would be safer to configure a [credentials store](https://docs.docker.com/engine/reference/commandline/login/#credentials-store)

The volume is required for the docker client to connect and issue commands to the docker daemon on the host.
