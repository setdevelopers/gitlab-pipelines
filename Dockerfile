# Gitlab Pipelines
 
# alpine:3.16.9
FROM alpine@sha256:0db9d004361b106932f8c7632ae54d56e92c18281e2dd203127d77405020abf6

# Install basic commands
RUN apk add busybox=1.35.0-r18 && \
    apk add bash=5.1.16-r2 && \
    apk add curl=8.5.0-r0 && \
    apk add gettext=0.21-r2 && \
    apk add grep=3.7-r0 && \
    rm -rf /var/cache/apk/*

# Install docker
RUN apk add iptables=1.8.8-r1 && \
    apk add docker=20.10.20-r0 && \
    rm -rf /var/cache/apk/*

# Install Jq
ARG JQ_VERSION="1.7.1"

RUN curl --silent --proto '=https' --tlsv1.2 -fOL https://github.com/jqlang/jq/releases/download/jq-${JQ_VERSION}/jq-linux-amd64 && \
    cp jq-linux-amd64 /usr/local/bin/jq && \
    chmod +x /usr/local/bin/jq && \
    rm jq-linux-amd64