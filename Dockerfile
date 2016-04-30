FROM andmos/git

RUN git clone https://github.com/andmos/dotfiles /opt/dotfiles; \
    cd /opt/dotfiles; \
    chmod +x copyDotFilesToProfile; chmod +x getScripts; \
    ./copyDotFilesToProfile; \
    ./getScripts ;

entrypoint [ "/bin/bash" ]

