FROM lscr.io/linuxserver/code-server

ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

COPY . $WORKDIR

RUN apt-get update && \
    apt-get install -y zsh \
    fonts-powerline \
    git && \
    chsh -s $(which zsh)

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TODO: Add custom .zshrc
# TODO: Install zsh plugins
# Reference: https://gist.github.com/willianfalbo/a6a69de0ef83815174042363313ec668

EXPOSE 8443
