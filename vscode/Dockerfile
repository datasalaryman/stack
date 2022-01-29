FROM lscr.io/linuxserver/code-server

ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

ENV PUID=0 
ENV PGID=0 
ENV TZ=Asia/Manila
ENV DEFAULT_WORKSPACE=/home/code

RUN apt-get update && \
    apt-get install -y zsh \
    fonts-powerline \
    wget \
    git \
    vim \
    build-essential \ 
    python3.8-venv \
    zsh

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)"

RUN chsh --shell $(which zsh)

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