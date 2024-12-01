# Container Security Testing Repository

This repository contains a collection of container images used for testing scanning and signing processes. Each image represents different scenarios and technologies, providing a comprehensive test suite for container security workflows.

## Repository Structure

- `bitcoind/` - Bitcoin node container
- `crazy_bad/` - Deliberately vulnerable container for security testing
- `flask-app/` - Python Flask web application
- `nodejs-app/` - Node.js Express web application
- `scripts/` - Build and upload scripts for each container

## Container Images

### Bitcoin Node (bitcoind/)
A container running a Bitcoin node based on Ubuntu 20.04. This image demonstrates running a cryptocurrency node in a containerized environment.

### Crazy Bad Container (crazy_bad/)
A deliberately vulnerable container designed to trigger security scanners. Contains various security anti-patterns, vulnerable packages, and simulated malicious behavior. **For security testing only!**

### Flask Application (flask-app/)
A simple Python Flask web application running on Python 3.9. This image demonstrates a basic web server implementation using Python.

### Node.js Application (nodejs-app/)
A simple Node.js Express web application running on Node.js 16. This image demonstrates a basic web server implementation using JavaScript.

## Building and Publishing

Each container can be built and published to JFrog Artifactory using the scripts provided in the `scripts/` directory. The workflow includes:

1. Building the container image
2. Scanning the image for vulnerabilities
3. Signing the image
4. Uploading to JFrog Artifactory

### Prerequisites

- Docker installed and configured
- Access to JFrog Artifactory
- JFrog CLI installed and configured
- Docker credentials configured for JFrog Artifactory

### Usage

1. Set up your JFrog Artifactory credentials:
   ```bash
   export JFROG_USER=your-username
   export JFROG_PASS=your-password
   export JFROG_URL=your-artifactory-url
   ```

2. Use the build scripts to build and publish individual images:
   ```bash
   ./scripts/build-bitcoind.sh
   ./scripts/build-flask-app.sh
   ./scripts/build-nodejs-app.sh
   ./scripts/build-crazy-bad.sh  # Security testing only!
   ```

## Security Testing

These images are designed to test various aspects of container security:

1. Vulnerability Scanning
   - OS-level vulnerabilities
   - Application dependencies
   - Known CVEs
   - Behavioral analysis (crazy_bad container)

2. Image Signing
   - Digital signatures
   - Chain of trust
   - Signature verification

3. Security Best Practices
   - Base image selection
   - Dependency management
   - Configuration hardening
   - Anti-pattern detection

4. Runtime Security
   - Behavioral monitoring
   - Resource usage patterns
   - Network activity
   - File system changes

## Security Testing Scenarios

The repository includes containers that test different security aspects:

1. Standard Applications (bitcoind, flask-app, nodejs-app)
   - Normal operation patterns
   - Standard dependencies
   - Common configurations

2. Security Test Case (crazy_bad)
   - Vulnerable packages
   - Security anti-patterns
   - Simulated malicious behavior
   - Runtime anomalies

## Contributing

When adding new test cases or modifying existing ones, please:

1. Update the relevant README.md in the image directory
2. Add appropriate build and upload scripts
3. Document any special considerations or test cases
4. Test the full workflow including scanning and signing

## ⚠️ Security Warning

The crazy_bad container is designed to trigger security scanners and should ONLY be used in isolated testing environments. Never run it in production or on shared systems.

## License

This repository is intended for security testing purposes only. Please ensure you have appropriate permissions before using any third-party components included in these images.