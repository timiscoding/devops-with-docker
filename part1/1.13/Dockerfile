FROM openjdk:8

WORKDIR /spring-example-project
RUN apt update && apt install -y git
RUN git clone https://github.com/docker-hy/spring-example-project.git .
RUN ./mvnw package
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]