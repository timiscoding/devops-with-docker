FROM ubuntu:latest
# make apiurl available to use. value specified in docker-compose.yml build > args
ARG apiurl
WORKDIR /frontend-example-docker
RUN apt-get update && apt-get install -y curl
RUN curl -SL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
COPY ./frontend-example-docker .
ENV NODE_ENV=production API_URL=$apiurl
RUN npm i && npm run build && npm -g i serve
CMD ["serve", "-s", "-l", "5000", "dist"]
