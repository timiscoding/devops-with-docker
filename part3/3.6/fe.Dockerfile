# builds https://github.com/docker-hy/frontend-example-docker
# image sizes
# -----------
# ubuntu:16.04  526MB
# alpine        337MB
# multistage    93.3MB

FROM node:10-alpine AS build-stage

ENV NODE_ENV=production \
    NPM_CONFIG_PREFIX=/home/node/.npm-global

WORKDIR /build
COPY . .
RUN npm i && npm run build && npm i -g serve

FROM node:10-alpine

# enables global npm installs
ENV NODE_ENV=production \
    NPM_CONFIG_PREFIX=/home/node/.npm-global \
    PATH=$PATH:/home/node/.npm-global/bin

WORKDIR /app
COPY --from=build-stage /build/dist .
COPY --from=build-stage /home/node/.npm-global/ /home/node/.npm-global/
RUN chown -R node .

USER node

EXPOSE 5000
CMD ["serve", "-s", "-l", "5000"]
