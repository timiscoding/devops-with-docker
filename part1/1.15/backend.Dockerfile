# create a label so we can use it later for the copy op
FROM node:14-alpine AS intermediate

RUN apk add --update git
# we don't want the whole repo so create a copy in this temp container
RUN git clone https://github.com/timiscoding/blog-list.git

FROM node:14-alpine

WORKDIR /blog-list-server
RUN apk add --update-cache \
  python \
  build-base
COPY --from=intermediate /blog-list/server .
RUN npm install
# Containers can talk to each other by their container names only if:
#   * they are connected to a user created network. ie. not the default
#   * each container has a user created name. ie. docker run --name <name>
# See https://maximorlov.com/4-reasons-why-your-docker-containers-cant-talk-to-each-other/
# https://github.com/docker/for-win/issues/1009
#
# To get server to connect to mongo container by the name 'blog-list-mongo':
# 1. create a new network with a name eg. isolated
#    'docker network create isolated'
# 2. run a mongo container and connect it to the network and give it the same
#   name as seen in the env var below
#   'docker run --network isolated --name blog-list-mongo mongo:3.4'
# 3. run this container and connect it to the same network
#   'docker run --rm --network isolated -p 3003:3003 blog-list-server'
# You can confirm both containers are connected to the same network by doing
#   'docker network inspect isolated'
ENV MONGODB_URI="mongodb://blog-list-mongo:27017" PORT=3003 SECRET=shhhh
EXPOSE 3003
CMD ["npm", "start"]
