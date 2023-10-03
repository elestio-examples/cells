#!/usr/bin/env bash
cp tools/docker/images/cells/* ./
mv dockerfile Dockerfile
sed -i "s~ARG version~ARG version=4.2.7~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/cells:latest | docker load