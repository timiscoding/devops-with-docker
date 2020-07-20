# builds https://github.com/docker-hy/frontend-example-docker
# image sizes
# -----------
# ubuntu:16.04  526MB
# alpine        337MB

FROM node:10-alpine

# enables global npm installs
ENV NODE_ENV=production \
    NPM_CONFIG_PREFIX=/home/node/.npm-global \
    PATH=$PATH:/home/node/.npm-global/bin

WORKDIR /app
COPY . .
RUN chown -R node .

USER node

EXPOSE 5000
RUN npm i && npm run build && npm i -g serve

CMD ["serve", "-s", "-l", "5000", "dist"]
