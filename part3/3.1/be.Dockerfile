# size after optimizing: 313MB
FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt-get install -y nodejs && \
    apt-get purge -y --autoremove curl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN npm i

CMD ["npm", "start"]