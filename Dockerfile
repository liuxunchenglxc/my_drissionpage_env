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
# ENV UV_SYSTEM_PYTHON=true
ENV UV_BREAK_SYSTEM_PACKAGES=true
ENV PATH=/root/.local/bin:$PATH
RUN wget -qO- https://astral.sh/uv/install.sh | sh \
    && uv python install 3.13 --default \
    && uv pip install --system --no-cache-dir DrissionPage

#7 2.885 Installed 18 packages in 18ms
#7 2.885  + certifi==2026.7.22
#7 2.885  + charset-normalizer==3.4.9
#7 2.885  + click==8.4.2
#7 2.886  + cssselect==1.4.0
#7 2.886  + drissionget==1.2.1
#7 2.886  + drissionpage==4.1.1.4
#7 2.886  + drissionrecord==2.0.1
#7 2.886  + et-xmlfile==2.0.0
#7 2.886  + filelock==3.32.0
#7 2.886  + idna==3.18
#7 2.886  + lxml==6.1.1
#7 2.886  + openpyxl==3.1.5
#7 2.886  + psutil==7.2.2
#7 2.886  + requests==2.34.2
#7 2.886  + requests-file==3.0.1
#7 2.886  + tldextract==5.3.1
#7 2.886  + urllib3==2.7.0
#7 2.886  + websocket-client==1.9.0

WORKDIR /workspace
