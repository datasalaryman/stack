#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./start.sh

Start Github Action Runner after building image.

'
    exit
fi

ACCESS_TOKEN=$ACCESS_TOKEN

REG_TOKEN="$(
  curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token ${ACCESS_TOKEN}" \
  https://api.github.com/repos/datasalaryman/stack/actions/runners/registration-token | \
  jq .token --raw-output
)"

cd /home/docker/actions-runner || exit


./config.sh --url https://github.com/datasalaryman/stack --token "${REG_TOKEN}"

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token "${REG_TOKEN}"
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!