# syntax=docker/dockerfile:1

# Build for multiple architectures with x86_64 as primary
FROM --platform=$TARGETPLATFORM python:3.9-slim

# Set ARG for platform-specific commands
ARG TARGETPLATFORM
ARG BUILDPLATFORM

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Define the command to run the application
CMD ["python", "app.py"]

# Add platform-specific metadata
LABEL org.opencontainers.image.architecture="amd64"
LABEL org.opencontainers.image.description="Flask web application container (Multi-arch with x86_64 primary)"
