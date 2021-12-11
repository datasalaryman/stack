.SHELL = /bin/bash

run:
	mkdir /opt/vscode
	mkdir /opt/vscode/config
	docker run -d \
		--name=code \
  		-e PUID=0 \
  		-e PGID=0 \
  		-e TZ=Asia/Manila \
  		-p 8443:8443 \
  		-v /opt/vscode/config:/config \
		-v /root:/home \
  		--restart unless-stopped \
  		lscr.io/linuxserver/code-server