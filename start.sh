#!/bin/bash

cd /app
pipenv install
cd "$DJANGO_APP_DIR"
pipenv run python manage.py migrate
pipenv run python manage.py runserver 0.0.0.0:8000
