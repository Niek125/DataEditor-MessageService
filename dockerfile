# Start with a base image containing Java runtime
FROM openjdk:11-jdk

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port available to the world outside this container
EXPOSE 8094

# The application's jar file
# The jar file's name is the pom.xml artifactId-version.jar, if this name needs to be changed, it needs to be changed a total of 3 times in this file
ARG JAR_FILE=target/messageservice-0.0.1-SNAPSHOT.jar

RUN mkdir /dataeditor
WORKDIR /dataeditor

# Add the application's jar to the container
ADD ${JAR_FILE} /dataeditor/messageservice-0.0.1-SNAPSHOT.jar

# Run the jar file
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-jar","/dataeditor/messageservice-0.0.1-SNAPSHOT.jar"]