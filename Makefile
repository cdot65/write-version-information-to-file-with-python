SHELL := /usr/bin/env bash
.DEFAULT_GOAL := help
.PHONY: help python container shell

DOCKER_IMG = registry.gitlab.com/cremsburg/juniper-automation-container
DOCKER_TAG = 0.1.2

help:
	@echo ''
	@echo 'Makefile will help us build with the following commands'
	@echo '		make container				builds the container'
	@echo '		make shell				runs the container and gives you shell access'
	@echo '		make python				runs the Ansible playbook'


python:
	docker run -it \
	--rm \
	-v $(PWD)/python/:/home/python \
	-w /home/python/ \
	$(DOCKER_IMG):$(DOCKER_TAG) python app.py

container:
	docker build -t $(DOCKER_IMG):$(DOCKER_TAG) docker/

shell:
	docker run -it \
	--rm \
	-v $(PWD)/python/:/home/python \
	-w /home/python/ \
	$(DOCKER_IMG):$(DOCKER_TAG) /bin/bash
