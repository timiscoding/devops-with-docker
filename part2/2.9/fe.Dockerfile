FROM ubuntu:latest
# no longer defining API_URL env var as we want the requests
# going to /api with the same origin where the static files
# were served.
# it is now nginx's responsibility to forward the api requests
# to the right location
WORKDIR /frontend-example-docker
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs
COPY ./frontend-example-docker .
RUN npm i
EXPOSE 5000
CMD ["npm", "start"]

