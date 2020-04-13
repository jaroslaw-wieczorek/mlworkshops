FROM ubuntu:latest

RUN apt update -y && apt install -y make
RUN apt install -y git
RUN apt install -y gcc
RUN gcc --version
RUN apt install -y build-essential
RUN apt install -y moreutils
RUN apt install -y --no-install-recommends \
    python3.6 \
    python3-pip

RUN python --version
RUN git clone https://github.com/usnistgov/SCTK.git
WORKDIR SCTK
RUN make config && make all && make check &&  make install && make doc
ENV PATH=$PATH:/SCTK/bin

