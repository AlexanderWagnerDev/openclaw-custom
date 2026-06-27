FROM ghcr.io/openclaw/openclaw:latest

USER root

# Switch apt sources to HTTPS
RUN sed -i 's|http://|https://|g' /etc/apt/sources.list /etc/apt/sources.list.d/*.list 2>/dev/null || true

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    gh \
    nano \
    jq \
    ripgrep \
    fzf \
    tree \
    wget \
    curl \
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
    make \
    htop \
    btop \
    ffmpeg \
    sqlite3 \
    moreutils \
    nmap \
    iperf3 \
    rsync \
    mediainfo \
    tcpdump \
    socat \
    bat \
    fd-find \
    lsof \
    srt-tools \
    libsrt-openssl-dev \
    v4l-utils \
    dmidecode \
    ca-certificates \
    iproute2 \
    openssl \
    whois \
    locales \
    && locale-gen en_US.UTF-8 \
    && locale-gen de_DE.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

USER node

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
ENV PATH=$PATH:/home/node/.local/bin

RUN pip install --user --break-system-packages yt-dlp psutil

RUN npm install -g npm clawhub \
    @openclaw/whatsapp \
    @openclaw/nextcloud-talk \
    @openclaw/twitch \
    @anthropic-ai/claude-code \
    @openai/codex \
    opencode-ai \
    @steipete/summarize
