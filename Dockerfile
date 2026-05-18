FROM python:3.13

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    wget \
    gnupg \
    xvfb \
    libxi6 \
    libnss3 \
    xauth \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    && wget -q -O - https://google.com | gpg --dearmor -o /usr/share/keyrings/googlechrome-linux-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/googlechrome-linux-keyring.gpg] http://google.com stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# 安装 DrissionPage（这里装好后，脚本仓库就不需要重复下载了）
RUN pip install --no-cache-dir DrissionPage

WORKDIR /workspace
