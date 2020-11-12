#!/bin/sh
set -e
config_file="/prv/.pre-commit-config.yaml"

src_dir=${SRC_DIR:-/app}
cd ${src_dir}
if [ -f ".pre-commit-config.yaml" ]; then
    config_file=".pre-commit-config.yaml"
fi

pre-commit run --config "${config_file}" --all-files --show-diff-on-failure
