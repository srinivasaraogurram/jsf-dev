Perfect! ✅ You've successfully launched **Tomcat 9.0.107 with Java 8 and Maven** inside **GitHub Codespaces**.

---

## 👉 Step 2: Scaffold a Hello World JSF Application

We’ll do the following:

1. 🏗 Create a basic Maven web project.
2. 🧩 Add JSF dependencies.
3. 📄 Add a simple `index.xhtml` page.
4. 👨‍💻 Add a JSF backing bean (`HelloBean.java`).
5. 🛠 Package the WAR.
6. 🚀 Deploy it to Tomcat inside your Codespace.

---

### ✅ 1. Create a Maven JSF Web App

Run the following in your Codespace terminal:

```bash
mvn archetype:generate -DgroupId=com.example \
    -DartifactId=hello-jsf \
    -DarchetypeArtifactId=maven-archetype-webapp \
    -DinteractiveMode=false
```

```bash
cd hello-jsf
```

---

### ✅ 2. Update `pom.xml` to Add JSF (Jakarta Faces) Dependencies

Open `pom.xml` and replace the content with this:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>com.example</groupId>
  <artifactId>hello-jsf</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>war</packaging>

  <name>hello-jsf</name>

  <properties>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  </properties>

  <dependencies>
    <!-- JSF 2.3 Mojarra -->
    <dependency>
      <groupId>org.glassfish</groupId>
      <artifactId>jakarta.faces</artifactId>
      <version>2.3.17</version>
    </dependency>
  </dependencies>

  <build>
    <finalName>hello-jsf</finalName>
  </build>
</project>
```

---

### ✅ 3. Add `index.xhtml` in `src/main/webapp`

Create file:

```
src/main/webapp/index.xhtml
```

```xml
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html">
<h:head>
    <title>Hello JSF</title>
</h:head>
<h:body>
    <h3>JSF Hello World</h3>
    <h:form>
        <h:outputText value="Enter your name: " />
        <h:inputText value="#{helloBean.name}" />
        <h:commandButton value="Say Hello" action="#{helloBean.sayHello}" />
        <br/><br/>
        <h:outputText value="#{helloBean.message}" />
    </h:form>
</h:body>
</html>
```

---

### ✅ 4. Add Backing Bean

Create:

```
src/main/java/com/example/HelloBean.java
```

```java
package com.example;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import java.io.Serializable;

@ManagedBean
@SessionScoped
public class HelloBean implements Serializable {
    private String name;
    private String message;

    public String sayHello() {
        message = "Hello, " + name + "!";
        return null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMessage() {
        return message;
    }
}
```

---

### ✅ 5. Configure `web.xml`

Create or update:

```
src/main/webapp/WEB-INF/web.xml
```

```xml
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         version="3.1">

  <display-name>hello-jsf</display-name>

  <welcome-file-list>
    <welcome-file>index.xhtml</welcome-file>
  </welcome-file-list>

  <context-param>
    <param-name>javax.faces.PROJECT_STAGE</param-name>
    <param-value>Development</param-value>
  </context-param>

  <servlet>
    <servlet-name>Faces Servlet</servlet-name>
    <servlet-class>javax.faces.webapp.FacesServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
  </servlet>

  <servlet-mapping>
    <servlet-name>Faces Servlet</servlet-name>
    <url-pattern>*.xhtml</url-pattern>
  </servlet-mapping>
</web-app>
```

---

### ✅ 6. Build the WAR

```bash
mvn clean package
```

This will create:

```
target/hello-jsf.war
```

---

### ✅ 7. Deploy to Tomcat

Copy the WAR to Tomcat’s webapps folder:

```bash
cp target/hello-jsf.war $CATALINA_HOME/webapps/
```

Then restart Tomcat:

```bash
catalina.sh stop
sleep 2
catalina.sh run
```

---

### 🧪 Test the App

Go to:

**[http://localhost:8080/hello-jsf](http://localhost:8080/hello-jsf)**

You should see the **JSF Hello World** page 🎉

---

Would you like me to help you commit this structure to your GitHub repo or assist with next enhancements like PrimeFaces or JSF with Bootstrap?
