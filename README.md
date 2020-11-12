# Pull-Request Verifier - pre-commit

This Docker image allows the use of [pre-commit](https://pre-commit.com/) tool to verify Pull-Requests in integration
pipelines like `GitHub Actions` or `Azure Pipelines`.

## How to build the images

### Python

```shell
$ docker build -t prv-pre-commit/python-3.7 -f python-3.7/Dockerfile .
```

### C++

```shell
$ docker build -t prv-pre-commit/cpp-clang10 -f cpp-clang10/Dockerfile .
```

## Usage

This Pull-Request Verifier will run the `pre-commit` in all files inside the `/app` directory
on the container, so make sure to map your repository to the `/app`.

e.g. for Python 3.7 project
```shell
$ docker run --rm -v /path/to/application/repository:/app prv-pre-commit/python-3.7
```

If you are running it inside the repository root you can just use:

e.g. for Python 3.7 project
```shell
$ docker run --rm -v ${PWD}:/app prv-pre-commit/python-3.7
```
