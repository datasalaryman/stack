.PHONY: clean build config run

SHELL:=/bin/bash

REPO=ghcr.io/datasalaryman/stack/code

VERSION=4.1.2
PASSWORD=vscode

build:
	docker build \
		-f Dockerfile \
		-t $(REPO):$(VERSION) .

push:
	docker push $(REPO):$(VERSION) && \
	docker tag $(REPO):$(VERSION) $(REPO):latest && \
	docker push $(REPO):latest

run: config
	docker container rm --force code &> /dev/null
	docker container prune --force
	docker run -d \
		-it \
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