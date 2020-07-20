# builds https://github.com/docker-hy/backend-example-docker
# image sizes
# -----------
# ubuntu:16.04  314MB
# alpine        121MB
FROM node:10-alpine

WORKDIR /app
COPY . .
RUN chown -R node .

USER node
RUN npm i

EXPOSE 8000
CMD ["npm", "start"]