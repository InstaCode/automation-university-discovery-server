FROM openjdk:11 as runtime
LABEL Vendor="Automation University"
LABEL label-with-value="discovery-server"
LABEL version="0.1"
LABEL name="discovery-server"
LABEL description="discovery-server"
#RUN apk add --no-cache openssl
#
#ENV DOCKERIZE_VERSION v0.6.1
#RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
#    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
#    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz
RUN mkdir ./app
COPY ./target/*discovery-server*.jar ./app/discovery-server.jar
WORKDIR ./app
EXPOSE 8082
#CMD [sh -c "dockerize -wait tcp://database:3306 -timeout 300s -wait-retry-interval 30s"]
#ENTRYPOINT ["sh","-c","dockerize -wait tcp://database:3306 -timeout 300s -wait-retry-interval 30s java -jar discovery-server.jar --spring.profiles.active=dev"]
ENTRYPOINT ["java", "-jar", "discovery-server.jar"]