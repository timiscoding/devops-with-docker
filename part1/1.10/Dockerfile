FROM ubuntu:latest

WORKDIR /frontend-example-docker
RUN apt-get update && apt-get install -y curl
RUN curl -SL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs git
RUN git clone https://github.com/docker-hy/frontend-example-docker.git .
ENV NODE_ENV=production
RUN npm i && npm run build && npm -g i serve
CMD ["serve", "-s", "-l", "5000", "dist"]
