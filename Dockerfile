# 1. Base image: dùng OpenJDK 11 slim
FROM openjdk:11-jdk-slim

# 2. Environment variables
ENV TOMCAT_VERSION 9.0.112
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# 3. Cài các gói cần thiết
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    tar \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# 4. Tải và cài Tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && tar xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz \
    && mv apache-tomcat-${TOMCAT_VERSION} /usr/local/tomcat \
    && rm apache-tomcat-${TOMCAT_VERSION}.tar.gz

# 5. Copy project JSP/Servlet vào webapps
# Giả sử project của bạn build ra folder `BT_CHUONG7` chứa index.jsp, cart.jsp, WEB-INF, v.v.
COPY BT_CHUONG7 $CATALINA_HOME/webapps/BT_CHUONG7

# 6. Mở port Tomcat
EXPOSE 8080

# 7. Start Tomcat
CMD ["catalina.sh", "run"]
