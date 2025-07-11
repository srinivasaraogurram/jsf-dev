FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV SDKMAN_DIR="/root/.sdkman"
ENV JAVA_VERSION="8.0.382-tem"
ENV MAVEN_VERSION="3.8.8"
ENV TOMCAT_VERSION="9.0.107"

# Install tools
RUN apt-get update && apt-get install -y \
  curl unzip zip git bash ca-certificates gnupg software-properties-common \
  && rm -rf /var/lib/apt/lists/*

# Install SDKMAN
RUN curl -s "https://get.sdkman.io" | bash

# Install Java and Maven via SDKMAN
RUN bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh && \
  sdk install java ${JAVA_VERSION} && \
  sdk install maven ${MAVEN_VERSION} && \
  sdk use java ${JAVA_VERSION} && \
  sdk use maven ${MAVEN_VERSION}"

ENV PATH="$SDKMAN_DIR/candidates/java/current/bin:$SDKMAN_DIR/candidates/maven/current/bin:$PATH"

# Install Tomcat 9.0.107
RUN mkdir -p /opt/tomcat && \
  curl -fsSL https://downloads.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz | \
  tar xz --strip-components=1 -C /opt/tomcat && \
  chmod +x /opt/tomcat/bin/*.sh

ENV CATALINA_HOME=/opt/tomcat
ENV PATH="$CATALINA_HOME/bin:$PATH"

WORKDIR /workspace
