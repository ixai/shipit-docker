# shipit-docker

This image was built to test [`shipit`](https://github.com/Shopify/shipit-engine/). It builds on top of both their [setup guide](https://github.com/Shopify/shipit-engine/blob/master/docs/setup.md) and [arthurnn/shipit_docker](https://github.com/arthurnn/shipit_docker).

## Key differences

* I removed a bunch of instructions from the [rails template](template.rb): it's no longer interactive; it drops support for Heroku; and it won't overwrite the configuration files, only some modifications remain.
* The [Dockerfile](Dockerfile) creates the rails application at build time.
* The [docker-compose](examples/docker-compose/docker-compose.yml) example mounts and copies the configuration files, instead of relying on environment variables.

## Usage

Build the image tagged as `docker-shipit:latest`.

```sh
docker build -t shipit-docker:latest .
```

## Testing locally

Setup [`ngrok`](https://ngrok.com/) and follow the instructions to run the [docker-compose example](examples/docker-compose/README.md).
