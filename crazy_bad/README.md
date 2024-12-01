# "Crazy Bad" Container - Security Test Case

This container is deliberately designed to trigger security scanners and demonstrate various security anti-patterns. It should ONLY be used in isolated testing environments.

## Security Issues

### Static Analysis Issues
1. Uses outdated base image (Debian 8)
2. Contains known vulnerable packages
3. Runs as root user
4. World-writable directories
5. Exposed sensitive ports
6. Weak file permissions on sensitive files
7. Hardcoded credentials
8. SSH server enabled

### Runtime Security Issues
The container includes a Python script that simulates malicious behavior:
1. Creates suspicious files (backdoor scripts)
2. Attempts to write SSH authorized_keys
3. Simulates cryptocurrency mining behavior
4. Performs internal network scanning
5. Attempts to access sensitive system files
6. High CPU usage patterns

## Expected Scanner Alerts

This container should trigger alerts for:
- Critical CVEs in base image and packages
- CIS Docker Benchmark violations
- DISA STIG violations
- Runtime behavioral analysis alerts
- Network security monitoring alerts
- Resource usage anomalies

## Building the Image

You can build this image using the provided build script:
```bash
../scripts/build-crazy-bad.sh
```

## ⚠️ WARNING

This container is for security testing purposes only. It contains:
- Vulnerable packages
- Simulated malicious behavior
- Resource-intensive operations
- Network scanning activities

DO NOT run this container:
- In production environments
- On shared systems
- Without proper isolation
- Outside of security testing contexts

## Testing Scenarios

1. Static Analysis:
   - Run container security scanners
   - Analyze package vulnerabilities
   - Check CIS benchmark compliance

2. Runtime Analysis:
   - Monitor container behavior
   - Track resource usage
   - Observe network activity
   - Check file system changes

## Notes

This container is designed to help test:
- Container security scanners
- Runtime security monitoring
- Behavioral analysis tools
- Security policy enforcement
