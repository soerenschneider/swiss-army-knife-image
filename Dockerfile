FROM golang:1.22.0 AS builder

ARG GRPCURL_VERSION=v1.8.9
RUN go install github.com/fullstorydev/grpcurl/cmd/grpcurl@${GRPCURL_VERSION}

FROM debian:stable-20241016-slim

COPY --from=builder /go/bin/grpcurl /usr/local/bin/

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
            tcpdump \
            telnet \
            tmux \
            traceroute \
            tcptraceroute \
            vim-tiny \
    && rm -rf /var/lib/apt/lists/*
