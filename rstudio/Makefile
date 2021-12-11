VERSION  = 4.1.2

run:
	docker run -d \
		--env-file .env \
		--rm \
		-p 8787:8787 \
		-v /root/code:/home/rstudio \
		rocker/verse:$(VERSION)