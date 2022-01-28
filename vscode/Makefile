.PHONY: build run

SHELL:=/bin/bash

VERSION=4.1.2
PASSWORD=vscode

build:
	docker build -t=code .

run:
	docker run -d \
		--name=code \
  		-e PUID=0 \
  		-e PGID=0 \
  		-e TZ=Asia/Manila \
		-e DEFAULT_WORKSPACE=/home/code \
		-e PASSWORD="$(PASSWORD)" \
  		-p 8443:8443 \
  		-v /opt/vscode/config:/config \
		-v /root/code:/home/code \
  		--restart unless-stopped \
  		code