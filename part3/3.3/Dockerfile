FROM ubuntu:16.04
ENV DOCKERVERSION=19.03.8
# curl and tar commands install docker client only
RUN apt-get update && apt-get install -y vim git curl && \
    curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz && \
    tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 -C /usr/local/bin docker/docker && \
    rm docker-${DOCKERVERSION}.tgz

WORKDIR /app
COPY ./build.sh .
RUN chmod o+x build.sh

ENTRYPOINT ["./build.sh"]