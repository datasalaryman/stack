.PHONY: clean build run

SHELL:=/bin/bash

VERSION=4.1.2
PASSWORD=vscode

clean:
	if [[ -d "/opt/vscode/config/" ]]; then \
		rm -r /opt/vscode/config/*; \
	fi

build:
	docker build -t=code .

config: 
	if ! [[ -d "/opt/vscode/config/User" ]]; then \
	-	mkdir /opt/vscode; \
	-	mkdir /opt/vscode/config; \
	-	mkdir /opt/vscode/config/User; \
	fi
	cp settings.json /opt/vscode/config/User/

run: config
	docker run -d \
		--name=code \
		-e PASSWORD="$(PASSWORD)" \
  		-p 8443:8443 \
  		-v /opt/vscode/config:/config \
		-v /root/code:/home/code \
  		--restart unless-stopped \
  		code