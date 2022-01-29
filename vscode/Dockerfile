FROM lscr.io/linuxserver/code-server

ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

ENV PUID=0 
ENV PGID=0 
ENV TZ=Asia/Manila
ENV DEFAULT_WORKSPACE=/home/code

VOLUME /opt/vscode/config
VOLUME /root/code

RUN apt-get update && \
    apt-get install -y zsh \
    fonts-powerline \
    git \
    vim \
    build-essential \ 
    python3.8-venv \
    zsh && \
    chsh --shell $(which zsh)

RUN echo "`curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh`" > install.sh
RUN sh ZSH="/config" install.sh --unattended

# TODO: Install zsh plugins
# Reference: https://gist.github.com/willianfalbo/a6a69de0ef83815174042363313ec668

EXPOSE 8443

# Expose different terminals for various applications
EXPOSE 25
EXPOSE 587
EXPOSE 465
EXPOSE 2525
EXPOSE 8080
EXPOSE 8000
EXPOSE 4000
EXPOSE 3000