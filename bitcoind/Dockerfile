# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get install -y bitcoind

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

