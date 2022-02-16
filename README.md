# Serverless Dash Exchange Rate Service

> Dash exchange rates service using Serverless framework

## Table of Contents
- [Install](#install)
  - [Prerequisites](#prerequisites)
- [Usage](#usage)
  - [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)

## Install

```sh
# set AWS_PROFILE here if necessary
AWS_PROFILE=...
serverless deploy
```

### Prerequisites

Requires a running Redis instance. Needs to be accessible via `REDIS_URL`
environment variable.

## Usage

Test it locally using a local Redis instance:

```sh
docker run -p 127.0.0.1:6379:6379 -d redis:alpine

serverless invoke local --function fetch --env REDIS_URL=host.docker.internal:6379
serverless invoke local --function serve --env REDIS_URL=host.docker.internal:6379
```

### Configuration

Deployment-specific config items should be placed in a `config.STAGE.yaml`
file, where STAGE is the deployment stage used (defaults to `dev`). This
includes VPC security groups and subnet IDs, custom domain for the API Gateway
and the URL for the Redis instance.

Feel free to copy the `config.example.yaml` file and modify the values therein.

## Contributing

Feel free to dive in! [Open an issue](https://github.com/dcginfra/sls-dash-rate-service/issues/new) or submit PRs.

## License

[ISC](LICENSE)
