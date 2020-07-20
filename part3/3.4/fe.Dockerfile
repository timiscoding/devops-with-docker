# builds https://github.com/docker-hy/frontend-example-docker
FROM ubuntu:16.04

ENV NODE_ENV=production

RUN apt-get update && apt-get install -y curl && \
    curl -SL https://deb.nodesource.com/setup_10.x | bash && \
    apt install -y nodejs && \
    # remove curl, config files and any dependencies
    apt-get purge -y --auto-remove curl && \
    # remove package lists
    rm -rf /var/lib/apt/lists/* && \
    useradd -m app

WORKDIR /app
COPY . .
RUN chown -R app .

USER app

RUN npm i && npm run build && npm i serve

CMD ["node_modules/.bin/serve", "-s", "-l", "5000", "dist"]
