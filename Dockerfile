
FROM python:3.7.5

RUN pip install pipenv
RUN apt install -y git

ENV PROJECT_DIR /usr/local/src/webapp

WORKDIR ${PROJECT_DIR}

COPY Pipfile Pipfile.lock ${PROJECT_DIR}/

RUN pipenv install --system --deploy

FROM python:3

RUN apt update -y && apt install -y make
RUN apt install -y git
RUN apt install -y gcc
RUN gcc --version
RUN apt install -y build-essential
RUN apt install -y moreutils
RUN python --version
RUN git clone https://github.com/usnistgov/SCTK.git
WORKDIR SCTK
RUN make config && make all && make check &&  make install && make doc
ENV PATH=$PATH:/SCTK/bin
RUN pip install matplotlib

