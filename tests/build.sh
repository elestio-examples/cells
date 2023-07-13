#!/usr/bin/env bash
cp tools/docker/images/cells/* ./
docker buildx build . --build-arg version=4.2.4 --output type=docker,name=elestio4test/cells:latest | docker load