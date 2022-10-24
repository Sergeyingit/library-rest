#!/bin/bash

# Pull new changes
git pull

# Prepare Jar
mvn clean
mvn package

# Ensure, that docker-compose stopped
docker-compose stop

# Add environment variables
export BOT_DB_USERNAME='bestuser'
export BOT_DB_PASSWORD='bestuser'

# Start new deployment
docker-compose up --build -d