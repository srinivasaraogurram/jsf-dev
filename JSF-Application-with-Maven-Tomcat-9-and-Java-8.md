# JSF Application with Maven, Tomcat 9, and Java 8

This guide walks you through building and deploying a JSF application using:

- **Java 8**
- **Apache Tomcat 9.0.107**
- **JSF 2.2 (javax.faces)**
- **Maven**
- **Deploy/undeploy via Maven**

---

## ✅ Prerequisites

- Java 8 (installed via SDKMAN)
- Maven (installed via SDKMAN)
- Apache Tomcat 9.0.107
- `catalina.sh` accessible via `$PATH`

---

## 🛠 Project Setup

### 1. Create Maven Web Project

```bash
mvn archetype:generate -DgroupId=com.example \
  -DartifactId=jsf-maven-app \
  -DarchetypeArtifactId=maven-archetype-webapp \
  -DinteractiveMode=false

cd jsf-maven-app
