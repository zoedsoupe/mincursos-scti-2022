#!/bin/bash

cockroach start-single-node \
  --certs-dir=certs \
  --listen-addr=localhost:26257 \
  --http-addr=localhost:8080
