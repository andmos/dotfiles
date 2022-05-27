FROM ubuntu:22.04

RUN apt update && apt install -y \
    git \
    vim \
    jq

RUN git clone https://github.com/andmos/dotfiles /opt/dotfiles; \
    cd /opt/dotfiles; \
    chmod +x copyDotFilesToProfile; \
    chmod +x getScripts; \
    ./copyDotFilesToProfile; \
    ./getScripts ;

WORKDIR /var/workspace

VOLUME  /var/workspace

ENTRYPOINT [ "/bin/bash" ]