FROM node:14-alpine

WORKDIR /home/blog-list-server
RUN apk add --update-cache \
  python \
  build-base
COPY . .
RUN npm install
ENV MONGODB_URI="mongodb://blog-list-mongo:27017" PORT=3003 SECRET=shhhh
EXPOSE 3003
CMD ["npm", "start"]
