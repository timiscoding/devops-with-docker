# before: 559MB
# after: 529MB
FROM ubuntu:16.04

ENV NODE_ENV=production

RUN apt-get update && apt-get install -y curl && \
    curl -SL https://deb.nodesource.com/setup_10.x | bash && \
    apt install -y nodejs && \
    # remove curl, config files and any dependencies
    apt-get purge -y --auto-remove curl && \
    # remove package lists
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN npm i && npm run build && npm -g i serve

CMD ["serve", "-s", "-l", "5000", "dist"]
