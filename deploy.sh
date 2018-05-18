docker login --username=_ --password="$HEROKU_TOKEN" registry.heroku.com
docker build -t registry.heroku.com/machinery-maintenance/web:latest .
docker push registry.heroku.com/machinery-maintenance/web:latest