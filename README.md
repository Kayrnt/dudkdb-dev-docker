# Duckdb-dev-docker

This repository contains a Dockerfile to build a Docker image with the latest development version of [DuckDB](https://github.com/duckdb/duckdb)

## Build

To build the image, run the following command:

```bash
make builder
make build
```

## Run

To run the image, run the following command:

```bash
make run
```

You can run one of queries using:
  
```bash
DUCKDB_QUERY="SELECT 1" make run-query
```
