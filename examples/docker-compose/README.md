# docker-compose example

Before starting the services, configure the [`config/secrets.yml`](config/secrets.yml) with the correct GitHub Application values under under the `production` section. If testing with `ngrok`, make sure both your secrets file and your GitHub Application are set to the correct `ngrok` URL.

```sh
docker-compose up
```

The first time running the service, you'll have to create the database, and install and run the migrations.

```sh
docker-compose exec web bundle exec rails shipit:install:migrations db:create db:migrate
```