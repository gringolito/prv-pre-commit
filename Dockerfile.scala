ARG OPENJDK_TAG=11
FROM openjdk:${OPENJDK_TAG}

COPY . /prv
WORKDIR /prv

ARG SBT_VERSION=1.3.13
RUN mv -fv .pre-commit-config.scala.yaml .pre-commit-config.yaml && \
    curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
    dpkg -i sbt-$SBT_VERSION.deb && \
    rm sbt-$SBT_VERSION.deb && \
    apt update && \
    apt -y full-upgrade && \
    apt install -y sbt git python3 python3-pip && \
    sbt sbtVersion && \
    pip3 install --no-cache-dir pre-commit && \
    pre-commit install-hooks && \
    apt purge -y python3-pip && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD /prv/pre-commit-run.sh
