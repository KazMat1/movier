up:
	docker compose up
upd:
	docker compose up -d
build:
	docker compose build
build-no-cache:
	docker compose build --no-cache
down:
	docker compose down
downv:
	docker compse down -v
stop:
	docker compose stop
project-init:
	make build
	make poetry-init
	make poetry-install

# NOTE: Author のみ n. それ以外はenter
poetry-init:
	docker compose run --rm api poetry init --name api --dependency fastapi --dependency uvicorn[standard]
# NOTE: 動かないかも
poetry-install:
	docker compose run --rm api poetry install --no-root
poetry-add:
	docker-compose exec api poetry add $(wordlist 2, $(words $(MAKECMDGOALS) - 2), $(MAKECMDGOALS))
poetry-add-dev:
	docker-compose exec api poetry add --group dev $(wordlist 2, $(words $(MAKECMDGOALS) - 2), $(MAKECMDGOALS))
