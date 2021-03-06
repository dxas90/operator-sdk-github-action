ARG RELEASE_VERSION=v0.17.0

FROM docker:stable

LABEL "name"="Operator-SDK Docker Action" \
    "maintainer"="Daniel Ramirez <dxas90@gmail.com>" \
    "version"="1.0.0"

ENV RELEASE_VERSION=${RELEASE_VERSION} \
    GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

RUN apk update -q && \
    apk upgrade -q && \
    apk --no-cache -q add bash build-base curl git go

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
