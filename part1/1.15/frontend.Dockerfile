FROM node:14-alpine

WORKDIR /home/blog-list-client
RUN apk add --update-cache \
  python \
  build-base
COPY . .
RUN npm install
RUN sed --in-place='' 's/"proxy":.*/"proxy": "http:\/\/blog-list-server:3003",/' package.json
EXPOSE 3000
CMD ["npm", "start"]
