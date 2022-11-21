#!/bin/bash

# Pull new changes
#git pull

# Prepare Jar
mvn clean
mvn package

# Ensure, that docker-compose stopped
docker-compose down

# Add environment variables
export DB_USERNAME=$1
export DB_PASSWORD=$2
export DB_KEYCLOAK_USERNAME=$3
export DB_KEYCLOAK_PASSWORD=$4

# Start new deployment
docker-compose up --build -d