FROM ubuntu:latest
ARG apiurl
WORKDIR /frontend-example-docker
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs
COPY ./frontend-example-docker .
RUN npm i
ENV API_URL=$apiurl
EXPOSE 5000
CMD ["npm", "start"]
