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
    && rm -rf /var/lib/apt/lists/*

USER node
