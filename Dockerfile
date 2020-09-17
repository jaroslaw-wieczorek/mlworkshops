FROM python:3.7.5
RUN apt update -y && apt install -y make
RUN pip install pipenv
RUN apt install -y git
WORKDIR 'home'

