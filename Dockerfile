# syntax=docker/dockerfile:1.2

FROM python:3-bookworm as base

RUN apt-get -qq update &&\
    apt-get dist-upgrade -y &&\
    echo "UTC" > /etc/localtime

FROM base as builder

ENV GEN ninja

RUN apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        ninja-build

WORKDIR /app        

RUN  git clone https://github.com/duckdb/duckdb.git

WORKDIR /app/duckdb

RUN make release

FROM base as app

RUN apt clean &&\
    rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/*

COPY --from=builder /app/duckdb/build/release/duckdb /usr/local/bin/duckdb

ENTRYPOINT [ "duckdb" ]




