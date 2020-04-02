FROM docker:stable

LABEL "name"="Operator-SDK Docker Action" \
    "maintainer"="Michael Fornaro <michaelfornaro@gmail.com>" \
    "version"="1.0.0"

ENV RELEASE_VERSION=v0.16.0 \
    GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux

RUN apk update -q && \
    apk upgrade -q && \
    apk --no-cache -q add bash build-base curl git go

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
