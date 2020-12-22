FROM conanio/clang10 AS pre-commit

USER root

COPY cpp/.pre-commit-config.yaml /prv/
COPY pre-commit-run.sh /prv/
WORKDIR /prv

RUN apt update -y && \
    apt dist-upgrade -y

RUN apt install -y git python3 python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install pre-commit && \
    git init . && \
    pre-commit install-hooks

FROM pre-commit

RUN apt install -y shellcheck cppcheck clang-format-10 && \
    update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-10 100 && \
    pip3 install cpplint

WORKDIR /app

CMD /prv/pre-commit-run.sh
