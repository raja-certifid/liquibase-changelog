#!/bin/bash

# Download Liquibase if not present
if [ ! -f "liquibase.jar" ]; then
    echo "Downloading Liquibase..."
    curl -L https://github.com/liquibase/liquibase/releases/download/v4.25.1/liquibase-core-4.25.1.jar -o liquibase.jar
fi

# Download MySQL JDBC driver if not present
if [ ! -f "mysql-connector-j.jar" ]; then
    echo "Downloading MySQL JDBC driver..."
    curl -L https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar -o mysql-connector-j.jar
fi

# Make script executable
chmod +x liquibase.jar

# Run Liquibase update
java -jar liquibase.jar \
    --classpath=mysql-connector-j.jar \
    --defaultsFile=liquibase.properties \
    update 