FROM ubuntu:latest
ARG fronturl
WORKDIR /backend-example-docker
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs
COPY ./backend-example-docker .
ENV FRONT_URL=$fronturl
RUN npm i
EXPOSE 8000
CMD ["npm", "start"]
