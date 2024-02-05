# Local setup

setup:
	docker run -d --name {{ cookiecutter.db_name_kebab_case }}\
	  -e POSTGRES_DB={{ cookiecutter.db_name }} \
	  -e POSTGRES_USER={{ cookiecutter.root_user_name }} \
  	  -e POSTGRES_PASSWORD={{ cookiecutter.root_user_password }} \
  	  -p 5432:5432 \
  	  postgres:{{ cookiecutter.postgres_version }}
	sleep 2
	"script/create_db.sh" | PGPASSWORD={{ cookiecutter.root_user_password }} psql --host localhost --port 5432 --user {{ cookiecutter.root_user_name }} {{ cookiecutter.db_name }}
	make migrate-local
	make stop-local

run:
	docker start {{ cookiecutter.db_name_kebab_case }}

stop:
	docker stop {{ cookiecutter.db_name_kebab_case }}

teardown:
	make stop
	docker rm {{ cookiecutter.db_name_kebab_case }}

reset:
	make teardown
	make setup
	make run

# Local flyway commands

migrate-local:
	cd config/flyway
	flyway -configFiles="config/flyway/local/flyway.conf" -locations="filesystem:." migrate

info-local:
	cd config/flyway
	flyway -configFiles="config/flyway/local/flyway.conf" -locations="filesystem:." info

undo-local:
	cd config/flyway
	flyway -configFiles="config/flyway/local/flyway.conf" -locations="filesystem:." undo

repair-local:
	cd config/flyway
	flyway -configFiles="config/flyway/local/flyway.conf" -locations="filesystem:." repair

# CICD make sure to set FLYWAY_USER and FLYWAY_PASSWORD env variables before running

migrate-prod:
	cd config/flyway
	flyway -configFiles="config/flyway/prod/flyway.conf" -locations="filesystem:." migrate

info-prod:
	cd config/flyway
	flyway -configFiles="config/flyway/prod/flyway.conf" -locations="filesystem:." info

undo-prod:
	cd config/flyway
	flyway -configFiles="config/flyway/prod/flyway.conf" -locations="filesystem:." undo

repair-prod:
	cd config/flyway
	flyway -configFiles="config/flyway/prod/flyway.conf" -locations="filesystem:." repair

# Utility functions
secret:
	openssl rand -base64 32