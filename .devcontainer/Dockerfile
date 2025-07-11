FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  curl unzip zip git bash ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Install SDKMAN
RUN curl -s "https://get.sdkman.io" | bash && \
    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && \
             sdk install java 8.0.382-tem && \
             sdk install maven 3.8.8"

ENV JAVA_HOME=/root/.sdkman/candidates/java/current
ENV MAVEN_HOME=/root/.sdkman/candidates/maven/current
ENV PATH="$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH"

# Install Tomcat 9
RUN curl -fsSL https://downloads.apache.org/tomcat/tomcat-9/v9.0.87/bin/apache-tomcat-9.0.87.tar.gz | tar xz -C /opt && \
    mv /opt/apache-tomcat-* /opt/tomcat && \
    chmod +x /opt/tomcat/bin/*.sh

ENV CATALINA_HOME=/opt/tomcat
ENV PATH="$CATALINA_HOME/bin:$PATH"

WORKDIR /workspace