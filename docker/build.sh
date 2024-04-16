#!/bin/bash

set -e

BUILDER_IMAGE_NAME=telegram-github-action-builder
RUNNER_IMAGE_NAME=telegram-github-action-runner

docker build -t $BUILDER_IMAGE_NAME -f Dockerfile.builder .


docker run --rm -v $(pwd)/../:/app $BUILDER_IMAGE_NAME 

cp ../target/release/telegram-github-acttion telegram-github-acttion

git add telegram-github-acttion