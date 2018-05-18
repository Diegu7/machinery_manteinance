#!/bin/bash
echo "$HEROKU_TOKEN" | docker login -u "$DOCKER_USERNAME" --password-stdin registry.heroku.com
docker build -t registry.heroku.com/machinery-maintenance/web:latest .
docker push registry.heroku.com/machinery-maintenance/web:latest