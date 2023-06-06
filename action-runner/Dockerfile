# base
FROM ubuntu:latest

# We should probably update these periodically
ARG RUNNER_VERSION=2.304.0
ARG DOCKER_COMPOSE_VERSION=1.28.2

ARG DEBIAN_FRONTEND=noninteractive

LABEL org.opencontainers.image.source=https://github.com/datasalaryman/stack

RUN \
  # update the base packages and add a non-sudo user
  apt-get update -y && apt-get upgrade -y && useradd -m docker && \
  apt-get install -y \
  apt-utils dialog -y curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev apt-transport-https ca-certificates gnupg-agent software-properties-common liblttng-ust1 && \
  # install docker
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
  echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
  # install docker-compose
  curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose && \
  # cd into the user directory, download and unzip the github actions runner
  cd /home/docker && mkdir actions-runner && cd actions-runner && \
  curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-arm64-${RUNNER_VERSION}.tar.gz && \
  tar xzf ./actions-runner-linux-arm64-${RUNNER_VERSION}.tar.gz && \
  # install some additional dependencies
  chown -R docker ~docker/actions-runner/* && \
  ~docker/actions-runner/bin/installdependencies.sh && \
  cd ./bin && \
  for lib in $(find . -name 'System.*'); do \
  toFile=$(echo "$lib" | sed -e 's/\.\/System\./.\/libSystem./g'); \
  if ! [ -f $toFile ]; then ln -s $lib $toFile; fi; \
  done && cd ..

WORKDIR /home/docker

RUN chown -R docker:docker /home/docker

# copy over the start.sh script
COPY --chown=docker:docker start.sh start.sh

# since the config and run script for actions are not allowed to be run by root,
# set the user to "docker" so all subsequent commands are run as the docker user
USER docker

# set the entrypoint to the start.sh script
ENTRYPOINT ["./start.sh"]