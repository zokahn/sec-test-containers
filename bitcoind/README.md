# Bitcoin Node Container

This container runs a Bitcoin node using the official `bitcoind` implementation. It's configured to run on Ubuntu 20.04 with the latest stable version of Bitcoin Core from the official PPA.

## Container Details

- Base Image: Ubuntu 20.04
- Bitcoin Implementation: Bitcoin Core (from bitcoin/bitcoin PPA)
- Exposed Ports:
  - 8333: P2P network port
  - 8332: RPC port

## Configuration

The container is configured with:
- Data directory: `/bitcoin`
- Environment variable: `BITCOIN_DATA=/bitcoin`

## Building the Image

You can build this image using the provided build script:
```bash
../scripts/build-bitcoind.sh
```

The script will:
1. Build the container image
2. Tag it appropriately
3. Upload it to JFrog Artifactory
4. Apply security scanning and signing

## Security Considerations

This image demonstrates:
- Using official package repositories
- Minimal base image
- Proper configuration of data directories
- Port exposure for required services only

## Testing

After building and running the container, you can test it by:
1. Checking if the Bitcoin node is running
2. Verifying P2P connections
3. Testing RPC functionality if configured

## Notes

- This is a basic Bitcoin node setup intended for testing
- No RPC credentials are configured by default
- Data persistence requires volume mounting
