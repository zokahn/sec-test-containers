# syntax=docker/dockerfile:1

# Build for multiple architectures with x86_64 as primary
FROM --platform=$TARGETPLATFORM node:16-alpine

# Set ARG for platform-specific commands
ARG TARGETPLATFORM
ARG BUILDPLATFORM

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install the dependencies
RUN npm install --production

# Copy the rest of the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["node", "app.js"]

# Add platform-specific metadata
LABEL org.opencontainers.image.architecture="amd64"
LABEL org.opencontainers.image.description="Node.js web application container (Multi-arch with x86_64 primary)"
