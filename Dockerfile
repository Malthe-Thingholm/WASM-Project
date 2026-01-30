# Use the official wasmCloud image
FROM wasmcloud/wasmcloud:latest

# Install NATS (the lattice communication bus)
USER root
RUN apt-get update && apt-get install -y curl && \
    curl -L https://github.com/nats-io/nats-server/releases/download/v2.10.7/nats-server-v2.10.7-linux-amd64.tar.gz | tar xz && \
    mv nats-server-v2.10.7-linux-amd64/nats-server /usr/local/bin/

# Expose the port Render will provide
EXPOSE 8080

# Start NATS in the background, then start wasmCloud
CMD nats-server -js & wasmcloud-host