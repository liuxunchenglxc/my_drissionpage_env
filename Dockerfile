FROM ubuntu:26.04

RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y \
    wget \
    gnupg \
    git \
    xvfb \
    fonts-wqy-microhei \
    python3-dev \
    python3-pip \
    python-is-python3 \
    build-essential \
    unzip \
    xsel \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt --fix-broken install -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf google-chrome-stable_current_amd64.deb

RUN pip install --break-system-packages --no-cache-dir DrissionPage resend pyperclip numpy scipy

RUN DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y \
    && apt install -y curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://raw.githubusercontent.com/go-gost/gost/master/install.sh | bash -s -- --install

RUN curl -LsSf https://llama.app/install.sh | sh

WORKDIR /workspace
