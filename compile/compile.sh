#!/bin/bash -ex
docker build -t ${NAME}:${VERSION} --rm compile
CONTAINER_ID=$(docker create ${NAME}:${VERSION})
docker cp ${CONTAINER_ID}:/freegeoip image/service/freegeoip/assets/freegeoip
docker cp ${CONTAINER_ID}:/go/src/github.com/fiorix/freegeoip/cmd/freegeoip/public image/service/freegeoip/assets/public
docker rm -v ${CONTAINER_ID}

chmod +x image/service/freegeoip/assets/freegeoip
