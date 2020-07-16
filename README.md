# Pull-Request Verifier - pre-commit

This Docker image allows the use of [pre-commit](https://pre-commit.com/) tool to verify Pull-Requests in integration
pipelines like `GitHub Actions` or `Azure Pipelines`.

## How to build the images

```shell
$ docker build -t prv-pre-commit .
```


## Usage

This Pull-Request Verifier will run the `pre-commit` in all files inside the `/app` directory
on the container, so make sure to map your repository to the `/app`.

```shell
$ docker run -v /path/to/application/repository:/app prv-pre-commit
```

If you are running it inside the repository root you can just use:

```shell
$ docker run -v ${PWD}:/app prv-pre-commit
```
