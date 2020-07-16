FROM python:3.7-alpine

COPY . /prv
WORKDIR /prv

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git && \
    apk add --no-cache --virtual .build-deps build-base && \
    pip3 install pre-commit && \
    pre-commit install-hooks && \
    apk del .build-deps

WORKDIR /app

CMD /prv/pre-commit-run.sh
