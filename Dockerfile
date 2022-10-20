FROM ruby:2.6.3

RUN apt update && \
    apt -f install -y && \
    apt-get install -y wget nodejs libqt4-dev libqtwebkit-dev && \
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install ./google-chrome-stable_current_amd64.deb -y
