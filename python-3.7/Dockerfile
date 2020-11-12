FROM python:3.7-alpine AS pre-commit

COPY python-3.7/.pre-commit-config.yaml /prv/
COPY pre-commit-run.sh /prv/
WORKDIR /prv

RUN apk update && \
    apk upgrade

RUN apk add --no-cache git && \
    apk add --no-cache --virtual .build-deps build-base libffi-dev openssl-dev && \
    pip3 install --upgrade pip && \
    pip3 install pre-commit && \
    git init . && \
    pre-commit install-hooks && \
    apk del .build-deps

FROM pre-commit

WORKDIR /app

CMD /prv/pre-commit-run.sh
