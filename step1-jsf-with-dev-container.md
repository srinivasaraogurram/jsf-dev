Sure! Here's your **fully updated DevContainer setup** with Tomcat version **9.0.107** using the provided link:

---

### 📁 `.devcontainer/devcontainer.json`

```json
{
  "name": "Java8-Tomcat9-JSF",
  "build": {
    "dockerfile": "Dockerfile"
  },
  "forwardPorts": [8080],
  "postCreateCommand": "bash .devcontainer/setup.sh",
  "customizations": {
    "vscode": {
      "extensions": ["vscjava.vscode-java-pack"]
    }
  }
}
```

---

### 🐳 `.devcontainer/Dockerfile`

```dockerfile
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
```

---

### 🛠️ `.devcontainer/setup.sh`

```bash
#!/bin/bash
set -e

# Reinitialize SDKMAN environment
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Activate Java and Maven
sdk use java 8.0.382-tem
sdk use maven 3.8.8

# Confirm setup
java -version
mvn -version
```

---

### ✅ What to Do Next

1. Add these 3 files to your GitHub repo in the `.devcontainer` folder.
2. Open the repo in **GitHub Codespaces**.
3. Once the container is ready, run Tomcat:

   ```bash
   catalina.sh run
   ```
4. It should start at [http://localhost:8080](http://localhost:8080).

---

Shall we continue to Step 2 now — scaffolding a Hello World JSF Maven app?
