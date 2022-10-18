THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: help build up start down destroy stop restart logs logs-app ps login-app db-shell db-create db-migrate test
help:
	make -pRrq  -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
# Docker + start + restart etc.
build:
	docker-compose -f docker-compose.yml build $(c)
up:
	docker-compose -f docker-compose.yml up -d $(c)
start:
	docker-compose -f docker-compose.yml start $(c)
down:
	docker-compose -f docker-compose.yml down $(c)
destroy:
	docker-compose -f docker-compose.yml down -v $(c)
stop:
	docker-compose -f docker-compose.yml stop $(c)
restart:
	docker-compose -f docker-compose.yml stop $(c)
	docker-compose -f docker-compose.yml up -d $(c)
ps:
	docker-compose -f docker-compose.yml ps

#Logs
logs:
	docker-compose -f docker-compose.yml noteapp/logs --tail=100 -f $(c)
logs-app:
	docker-compose -f docker-compose.yml noteapp/logs --tail=100 -f app
#login to app and mysql
login-app:
	docker exec -it docker1_app_1 /bin/bash
db-shell:
	docker exec -it docker1_db_1 mysql -uroot -ppassowrd

# Db create and migrations
db-create:
	docker exec -it docker1_app_1 rake db:create
db-migrate:
	docker exec -it docker1_app_1 rake db:migrate

test:
	docker exec -it docker1_app_1 rspec

# rails generation
# controller:
# 	docker exec -it docker1_app_1 rails generate controller

