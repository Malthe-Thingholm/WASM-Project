#!/bin/bash
# Start NATS with JetStream enabled (required for WADM)
nats-server -js & 

# Start wasmCloud Host
# We tell it to allow the 'httpserver' provider to use the Render-assigned port
export WASH_HTTP_SERVER_PORT=$PORT
wasmcloud-host