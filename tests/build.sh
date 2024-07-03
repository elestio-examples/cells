#!/usr/bin/env bash
cp tools/docker/images/cells/* ./
mv dockerfile Dockerfile

latest_tag=$(curl -s https://api.github.com/repos/pydio/cells/tags | grep -m 1 '"name"' | sed -E 's/.*"v([^"]+)".*/\1/')


sed -i "s~ARG version~ARG version=${latest_tag}~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/cells:latest | docker load