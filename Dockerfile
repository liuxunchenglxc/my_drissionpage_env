FROM python:3.13

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    wget \
    gnupg \
    git \
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
    fonts-ubuntu \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome-stable_current_amd64.deb || apt --fix-broken install -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf google-chrome-stable_current_amd64.deb

# 安装 DrissionPage（这里装好后，脚本仓库就不需要重复下载了）
RUN pip install --no-cache-dir DrissionPage \
    && cd /usr/local/lib/python3.13/site-packages/DrissionPage/_configs/ \
    %% sed -i "/browser_path/s/$(grep 'browser_path' 'configs.ini' | awk -F '=' '{print $2}')/\/usr\/bin\/google-chrome/" configs.ini

    ## Successfully installed DrissionGet-1.2.1 DrissionPage-4.1.1.4 DrissionRecord-2.0.1 certifi-2026.7.22 charset_normalizer-3.4.9 click-8.4.2 cssselect-1.4.0 et-xmlfile-2.0.0 filelock-3.32.0 idna-3.18 lxml-6.1.1 openpyxl-3.1.5 psutil-7.2.2 requests-2.34.2 requests-file-3.0.1 tldextract-5.3.1 urllib3-2.7.0 websocket-client-1.9.0

WORKDIR /workspace
