# 1. Base image
FROM tomcat:9.0.112-jdk11-openjdk-slim

# 2. Copy .war vào webapps
COPY BT_CHUONG7.war /usr/local/tomcat/webapps/BT_CHUONG7.war

# 3. Expose port Tomcat
EXPOSE 8080

# 4. Start Tomcat
CMD ["catalina.sh", "run"]
