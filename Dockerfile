FROM python:3.7-stretch

RUN apt-get update \
 && apt-get upgrade -y \
 apt-get install -y \
 libgconf2-4 \
 libnss3-1d \
 libxss1 \
 fonts-liberation \
 libappindicator1 \
 xdg-utils
 software-properties-common
 curl \
 unzip \
 wget \
 xvfb \

# install geckodriver and firefox

RUN GECKODRIVER_VERSION=`curl https://github.com/mozilla/geckodriver/releases/latest | grep -Po 'v[0-9]+.[0-9]+.[0-9]+'` && \
    wget https://github.com/mozilla/geckodriver/releases/download/$GECKODRIVER_VERSION/geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz && \
    tar -zxf geckodriver-$GECKODRIVER_VERSION-linux64.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/geckodriver

RUN add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa
RUN apt-get update -y
RUN apt-get install -y firefox
