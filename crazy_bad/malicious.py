  #!/usr/bin/env python

import os
import socket
import subprocess
import time
import random
from threading import Thread

def create_suspicious_files():
    """Create files that might trigger security scanners"""
    with open('/tmp/backdoor.sh', 'w') as f:
        f.write('#!/bin/bash\nwhile true; do nc -l 4444; done\n')
    os.chmod('/tmp/backdoor.sh', 0o755)
    
    with open('/root/.ssh/authorized_keys', 'w') as f:
        f.write('ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQ... fake@key')

def simulate_crypto_mining():
    """Simulate crypto mining behavior with high CPU usage"""
    while True:
        # Perform CPU-intensive calculations
        for _ in range(1000000):
            random.random() ** 2

def scan_internal_network():
    """Attempt to scan internal network"""
    common_ports = [22, 80, 443, 3306, 5432, 6379]
    while True:
        for ip in range(1, 255):
            for port in common_ports:
                try:
                    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
                    s.settimeout(0.1)
                    s.connect((f'172.17.0.{ip}', port))
                    s.close()
                except:
                    pass
        time.sleep(60)

def access_sensitive_files():
    """Try to access sensitive system files"""
    sensitive_files = [
        '/etc/shadow',
        '/etc/passwd',
        '/etc/ssl/private',
        '/root/.bash_history',
        '/var/log/auth.log'
    ]
    while True:
        for file in sensitive_files:
            try:
                open(file, 'r')
            except:
                pass
        time.sleep(30)

def main():
    print("Starting application...")
    
    # Create suspicious files
    create_suspicious_files()
    
    # Start threads for various suspicious activities
    Thread(target=simulate_crypto_mining).start()
    Thread(target=scan_internal_network).start()
    Thread(target=access_sensitive_files).start()
    
    # Keep main thread alive
    while True:
        time.sleep(60)

if __name__ == '__main__':
    main()
