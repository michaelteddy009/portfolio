include main/.env
sail := main/vendor/bin/sail

$(eval export $(shell sed -ne 's/ *#.*$$//; /./ s/=.*$$// p' main/.env))

.PHONY: up
up:
	docker-compose up -d

.PHONY: down
down:
	docker-compose down