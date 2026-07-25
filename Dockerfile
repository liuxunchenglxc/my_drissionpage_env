FROM ubuntu:26.04

RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y \
    wget \
    gnupg \
    git \
    xvfb \
    fonts-ubuntu \
    python3-dev \
    python3-pip \
    build-essential \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt --fix-broken install -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf google-chrome-stable_current_amd64.deb

# 安装 DrissionPage（这里装好后，脚本仓库就不需要重复下载了）
# ENV UV_SYSTEM_PYTHON=true
# ENV UV_BREAK_SYSTEM_PACKAGES=true
RUN pip install --break-system-packages --no-cache-dir DrissionPage

WORKDIR /workspace
