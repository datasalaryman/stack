.PHONY: clean build config run

SHELL:=/bin/bash

VERSION=4.1.2
PASSWORD=vscode

clean:
	if [[ -d "/opt/vscode/config" ]]; then \
		rm -r /opt/vscode/config; \
	fi

build:
	docker build -t=code .

config: 
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
	cp .zshrc /config/
	if ! [[ -d "/opt/vscode/config/data/User" ]]; then \
		mkdir -p /opt/vscode; \
		mkdir -p /opt/vscode/config; \
		mkdir -p /opt/vscode/config/data/; \
		mkdir -p /opt/vscode/config/data/User; \
	fi
	cp settings.json /opt/vscode/config/data/User/

run: config
	docker run -d \
		--name=code \
		-e PASSWORD="$(PASSWORD)" \
  		-p 8443:8443 \
  		-p 25:25 \
  		-p 587:587 \
  		-p 465:465 \
  		-p 2525:2525 \
  		-p 8080:8080 \
  		-p 8000:8000 \
  		-p 4000:4000 \
  		-p 3000:3000 \
  		-v /opt/vscode/config:/config \
		-v /root/code:/home/code \
  		--restart unless-stopped \
  		code