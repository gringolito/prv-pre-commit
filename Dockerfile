FROM python:3.7-slim

COPY . /prv
WORKDIR /prv

RUN apt update \
    && apt -y full-upgrade \
    && apt install -y git gcc \
    && pip3 install --no-cache-dir pre-commit \
    && pre-commit install-hooks \
    && apt purge -y gcc \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD /prv/pre-commit-run.sh
