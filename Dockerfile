FROM ubuntu:26.04

RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y \
    wget \
    gnupg \
    git \
    xvfb \
    fonts-ubuntu \
    build-essential \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt --fix-broken install -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf google-chrome-stable_current_amd64.deb

# 安装 DrissionPage（这里装好后，脚本仓库就不需要重复下载了）
ENV UV_SYSTEM_PYTHON=1
RUN wget -qO- https://astral.sh/uv/install.sh | sh \
    && uv python install 3.13 --default \
    && uv pip install DrissionPage

    ## Successfully installed DrissionGet-1.2.1 DrissionPage-4.1.1.4 DrissionRecord-2.0.1 certifi-2026.7.22 charset_normalizer-3.4.9 click-8.4.2 cssselect-1.4.0 et-xmlfile-2.0.0 filelock-3.32.0 idna-3.18 lxml-6.1.1 openpyxl-3.1.5 psutil-7.2.2 requests-2.34.2 requests-file-3.0.1 tldextract-5.3.1 urllib3-2.7.0 websocket-client-1.9.0

WORKDIR /workspace
