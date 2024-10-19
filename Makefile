SHELL=/bin/bash

ifeq ($(OS), Windows_NT)
OS_NAME="Windows"
else
UNAME=$(shell uname)
ifeq ($(UNAME),Linux)
OS_NAME="Linux"
else
ifeq ($(UNAME),Darwin)
OS_NAME="MacOS"
else
OS_NAME="Other"
endif
endif
endif

install:
	make build
	cp .env.example .env
	make up

build:
	docker compose build --no-cache

up:
	USER_NAME=$(shell id -nu) USER_ID=$(shell id -u) GROUP_NAME=$(shell id -ng) GROUP_ID=$(shell id -g) OS_NAME=$(OS_NAME) docker compose up -d

ps:
	docker compose ps

stop:
	docker compose stop

down:
	docker compose down -v

node:
	docker compose exec node bash