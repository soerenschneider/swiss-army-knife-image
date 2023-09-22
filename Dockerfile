FROM debian:stable-20230919-slim

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
