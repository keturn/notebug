FROM python:2


RUN adduser --disabled-password --gecos '' django

RUN mkdir -p /home/django/app
WORKDIR /home/django/app

RUN apt-get update && apt-get upgrade --yes

COPY requirements.txt /home/django/app/
RUN pip install --no-cache-dir -r requirements.txt
RUN django-admin startproject -v2 notebug
COPY settings.py notebug/notebug/
