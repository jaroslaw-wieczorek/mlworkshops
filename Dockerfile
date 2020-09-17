
FROM python:3.7.5
RUN apt update -y && apt install -y make
RUN pip install pipenv
RUN apt install -y git

ENV PROJECT_DIR ./anc-backend

WORKDIR ${PROJECT_DIR}
RUN echo "$(pwd)"
RUN echo "$(ls)"
RUN echo "$(cat Pipfile)"
RUN pipenv install --system --deploy --ignore-pipfile

RUN coverage run manage.py test
RUN coverage xml -o ./reports/coverage.xml
RUN coverage report > ./reports/coverage.txt
