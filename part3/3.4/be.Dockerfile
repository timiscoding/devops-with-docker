# builds https://github.com/docker-hy/backend-example-docker
FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt-get install -y nodejs && \
    apt-get purge -y --autoremove curl && \
    rm -rf /var/lib/apt/lists/* && \
# create a new user with home dir
    useradd -m app

WORKDIR /app
COPY . .
RUN chown -R app .

# switch to user, any commands will be run as the user app from now on
USER app

RUN npm i

CMD ["npm", "start"]