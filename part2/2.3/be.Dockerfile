FROM ubuntu:latest

WORKDIR /backend-example-docker
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs
COPY ./backend-example-docker .
RUN npm i
CMD ["npm", "start"]