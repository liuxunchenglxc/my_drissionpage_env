FROM python:3.13

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    wget \
    gnupg \
    xvfb \
    libxi6 \
    libgconf-2-4 \
    libnss3 \
    xauth \
    && wget -q -O - https://google.com | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://google.com stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# 安装 DrissionPage（这里装好后，脚本仓库就不需要重复下载了）
RUN pip install --no-cache-dir DrissionPage

WORKDIR /workspace
