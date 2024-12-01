# syntax=docker/dockerfile:1

# Build for multiple architectures with x86_64 as primary
FROM --platform=$TARGETPLATFORM ubuntu:20.04

# Set ARG for platform-specific commands
ARG TARGETPLATFORM
ARG BUILDPLATFORM

# Install dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get install -y bitcoind && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for Bitcoin data
RUN mkdir /bitcoin

# Set the Bitcoin data directory
ENV BITCOIN_DATA=/bitcoin

# Expose the Bitcoin P2P port
EXPOSE 8333

# Expose the RPC port
EXPOSE 8332

# Define the command to run the Bitcoin node
CMD ["bitcoind", "-datadir=/bitcoin"]

# Add platform-specific metadata
LABEL org.opencontainers.image.architecture="amd64"
LABEL org.opencontainers.image.description="Bitcoin node container (Multi-arch with x86_64 primary)"
