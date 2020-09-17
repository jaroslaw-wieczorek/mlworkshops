
FROM python:3.7.5
RUN apt update -y && apt install -y make
RUN pip install pipenv
RUN apt install -y git

ENV PROJECT_DIR ./anc-backend

WORKDIR ${PROJECT_DIR}
echo $(pwd)
RUN ls
RUN pipenv install

RUN pipenv run coverage run manage.py run tests
RUN pipenv run coverage xml -o ./reports/coverage.xml
RUN pipenv run coverage report > ./reports/coverage.txt
