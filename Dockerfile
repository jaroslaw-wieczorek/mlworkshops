FROM python:3.7.5
RUN apt update -y && apt install -y make
RUN pip install pipenv
RUN apt install -y git
RUN echo $(ls)
RUN cd 'home'
RUN echo "$(ls)"
RUN echo "$(cat Pipfile)"
RUN pipenv install --system --deploy

RUN coverage run manage.py test
RUN coverage xml -o ./reports/coverage.xml
RUN coverage report > ./reports/coverage.txt
