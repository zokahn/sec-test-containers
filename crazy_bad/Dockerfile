# syntax=docker/dockerfile:1

# Use an old, vulnerable base image with multi-arch support
FROM --platform=$TARGETPLATFORM debian:8

# Set ARG for platform-specific commands
ARG TARGETPLATFORM
ARG BUILDPLATFORM

# Run everything as root (bad practice)
USER root

# Install outdated packages with known vulnerabilities
# Note: Using platform-specific package versions for x86_64
RUN dpkg --add-architecture amd64 && \
    apt-get update && \
    apt-get install -y \
    apache2=2.4.10-10+deb8u7 \
    openssh-server=1:6.7p1-5+deb8u3 \
    python=2.7.9-1 \
    curl=7.38.0-4+deb8u5 \
    vim=2:7.4.488-7 \
    && apt-get clean

# Create world-writable directories (bad practice)
RUN mkdir /app && chmod 777 /app
RUN mkdir /data && chmod 777 /data

# Add some "secret" files with weak permissions
RUN echo "SECRET_KEY=super_secret_123" > /app/.env && \
    chmod 644 /app/.env
RUN echo "root:password123" > /app/credentials.txt && \
    chmod 644 /app/credentials.txt

# Copy a "malicious" Python script that simulates bad behavior
COPY malicious.py /app/

# Expose multiple ports including commonly exploited ones
EXPOSE 22 80 443 3306 6379

# Start SSH server and run our "malicious" script
CMD service ssh start && python /app/malicious.py

# Add platform-specific metadata (intentionally exposing architecture)
LABEL org.opencontainers.image.architecture="amd64"
LABEL org.opencontainers.image.description="Intentionally vulnerable container (Multi-arch with x86_64 primary)"
LABEL org.opencontainers.image.base.name="debian:8"
LABEL org.opencontainers.image.version="1.0.0"
LABEL maintainer="test@example.com"
