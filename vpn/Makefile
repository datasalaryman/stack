run:
	docker run -d \
		--name=vpn \
		--cap-add=NET_ADMIN \
  		--cap-add=SYS_MODULE \
  		-e PUID=0 \
  		-e PGID=0 \
  		-e TZ=Asia/Manila \
  		-e SERVERURL=vpn.datasalaryman.com \
  		-e SERVERPORT=51820 \
  		-e PEERS=2 \
  		-e PEERDNS=auto \
  		-e INTERNAL_SUBNET=10.13.13.0 \
  		-e ALLOWEDIPS=0.0.0.0/0 \
  		-p 51820:51820/udp \
  		-v /opt/vpn/config:/config \
  		-v /lib/modules:/lib/modules \
  		--sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  		--restart unless-stopped \
  		lscr.io/linuxserver/wireguard