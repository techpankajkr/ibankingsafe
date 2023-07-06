FROM ubuntu:20.04
ENV JAVA_HOME=/u01/middleware/jdk-11.0.2
ENV PATH=$PATH:$JAVA_HOME/bin

RUN mkdir -p /u01/middleware
WORKDIR /u01/middleware
ADD https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz .
RUN tar -xzvf openjdk-11.0.2_linux-x64_bin.tar.gz
RUN rm -rf openjdk-11.0.2_linux-x64_bin.tar.gz
COPY target/ibankingsafe-1.0.jar .
ENTRYPOINT [ "java", "-jar", "ibankingsafe-1.0.jar" ]