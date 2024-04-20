FROM maven AS BUILD

ADD . /app
WORKDIR /app
RUN mvn package

FROM tomcat:9.0
COPY --from=BUILD /app/target/*.war /usr/local/tomcat/webapps/