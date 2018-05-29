#!/bin/bash
echo "$HEROKU_TOKEN" | docker login -u "$HEROKU_TOKEN" --password-stdin registry.heroku.com
docker build --no-cache -t registry.heroku.com/machinery-maintenance/web:latest .
docker push registry.heroku.com/machinery-maintenance/web:latest