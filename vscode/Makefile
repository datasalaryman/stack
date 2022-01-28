.PHONY: clean build run

SHELL:=/bin/bash

VERSION=4.1.2
PASSWORD=vscode

clean:
	if [[ -d "opt/vscode/config/" ]]; then \
		rm -rf opt/vscode/config/; \
	fi

build:
	docker build -t=code .

run: build
	docker run -d \
		--name=code \
		-e PASSWORD="$(PASSWORD)" \
  		-p 8443:8443 \
  		-v /opt/vscode/config:/config \
		-v /root/code:/home/code \
  		--restart unless-stopped \
  		code