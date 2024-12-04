FROM golang:1.23.4 AS builder

ARG GRPCURL_VERSION=v1.8.9
RUN go install github.com/fullstorydev/grpcurl/cmd/grpcurl@${GRPCURL_VERSION}

ARG COSIGN_VERSION=v2.4.1
RUN go install github.com/sigstore/cosign/v2/cmd/cosign@${COSIGN_VERSION}

FROM debian:stable-20241111-slim

COPY --from=builder /go/bin/grpcurl /usr/local/bin/
COPY --from=builder /go/bin/cosign  /usr/local/bin/

RUN apt update \
    && apt -y upgrade \
    && apt -y install --no-install-recommends \
            arping \
            arptables \
            ca-certificates \
            curl \
            dnsutils \
            ethtool \
            git \
            iperf \
            iperf3 \
            iproute2 \
            ipset \
            iputils-ping \
            jq \
            ldap-utils \
            less \
            mtr \
            net-tools \
            netcat-openbsd \
            openssl \
            openssh-client \
            psmisc \
            socat \
            signify-openbsd \
            tcpdump \
            telnet \
            tmux \
            traceroute \
            tcptraceroute \
            vim-tiny \
    && rm -rf /var/lib/apt/lists/*
