FROM ghcr.io/openclaw/openclaw:latest

USER root

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    gh \
    jq \
    ripgrep \
    fzf \
    tree \
    wget \
    unzip \
    zip \
    openssh-client \
    patch \
    diffutils \
    tar \
    gzip \
    bzip2 \
    xz-utils \
    python3-pip \
    python3-venv \
    dnsutils \
    iputils-ping \
    netcat-openbsd \
    locales \
    && locale-gen en_US.UTF-8 \
    && locale-gen de_DE.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

USER node
