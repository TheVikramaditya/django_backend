build:
	docker-compose -f local.yml up --build -d --remove-orphans

up:
	docker-compose -f local.yml up -d

down:
	docker-compose -f local.yml down

show-logs:
	docker-compose -f local.yml logs

show-logs-api:
	docker-compose -f local.yml logs api

makemigrations:
	docker-compose -f local.yml run --rm api python manage.py makemigrations

migrate:
	docker-compose -f local.yml run --rm api python manage.py migrate

collectstatic:
	docker-compose -f local.yml run --rm api python manage.py collectstatic

down-v:
	docker-compose -f local.yml down -v

volume:
	docker volume inspect django_tuts_local_postgres_data

authors-db:
	docker-compose -f local.yml exec postgres psql --username=adi --dbname=authors-live

flake8:
	docker-compose -f local.yml exec api flake8 .

black-check:
	docker-compose -f local.yml exec api black --check --exclude=migrations .

black-diff:
	docker-compose -f local.yml exec api black --diff --exclude=migrations .

black:
	docker-compose -f local.yml exec api black --exclude=migrations .

isort-check:
	docker-compose -f local.yml exec api isort . --check-only --skip myenv --skip migrations

isort-diff:
	docker-compose -f local.yml exec api isort . --diff --skip myenv --skip migrations

isort:
	docker-compose -f local.yml exec api isort . --skip myenv --skip migrations


