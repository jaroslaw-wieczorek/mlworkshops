
FROM python:3.7.5
RUN apt update -y && apt install -y make
RUN pip install pipenv
RUN apt install -y git

ENV PROJECT_DIR /anc-backend

WORKDIR ${PROJECT_DIR}

COPY Pipfile Pipfile.lock ${PROJECT_DIR}/

RUN pipenv install --system --deploy

