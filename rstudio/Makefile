.PHONY: run

SHELL:=/bin/bash

VERSION=4.1.2
USER=datasalaryman
PASSWORD=rstudio

run:
	docker run -d \
	    --name=rstudio \
		-e USER=$(USER) \
		-e PASSWORD=$(PASSWORD) \
		--rm \
		-p 8787:8787 \
		-v /root/code:/home/rstudio \
		rocker/verse:$(VERSION)