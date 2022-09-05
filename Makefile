#* Variables
SHELL := /usr/bin/env bash

.PHONY: poetry-download
poetry-download:
	curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | $(PYTHON) -

.PHONY: install-env
install-env:
	cp .env ./frontend/.env
	cp .env ./backend/.env

.PHONY: install
install: install-env
	docker compose --env-file .env up --build -d

#* Cleaning
.PHONY: env-remove
env-remove:
	rm -f ./frontend/.env
	rm -f ./backend/.env

.PHONY: pycache-remove
pycache-remove:
	find . | grep -E "(__pycache__|\.pyc|\.pyo$$)" | xargs rm -rf

.PHONY: dsstore-remove
dsstore-remove:
	find . | grep -E ".DS_Store" | xargs rm -rf

.PHONY: mypycache-remove
mypycache-remove:
	find . | grep -E ".mypy_cache" | xargs rm -rf

.PHONY: ipynbcheckpoints-remove
ipynbcheckpoints-remove:
	find . | grep -E ".ipynb_checkpoints" | xargs rm -rf

.PHONY: pytestcache-remove
pytestcache-remove:
	find . | grep -E ".pytest_cache" | xargs rm -rf

.PHONY: spidercache-remove
spidercache-remove:
	find . | grep -E ".spider_cache" | xargs rm -rf

.PHONY: build-remove
build-remove:
	rm -rf ./frontend/dist/

.PHONY: cleanup
cleanup: env-remove pycache-remove dsstore-remove mypycache-remove ipynbcheckpoints-remove pytestcache-remove spidercache-remove build-remove
