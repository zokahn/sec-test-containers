# Node.js Web Application Container

This container runs a simple Express.js web application that serves a "Hello, World!" message. It's built using Node.js 16 and the Express framework.

## Container Details

- Base Image: node:16-alpine
- Application Framework: Express.js
- Exposed Port: 3000
- Working Directory: /app

## Application Structure

```
nodejs-app/
├── Dockerfile
├── app.js
├── package.json
└── package-lock.json
```

- `app.js`: Main application file containing the Express web server
- `package.json`: Node.js dependencies and project configuration
- `package-lock.json`: Locked versions of dependencies
- `Dockerfile`: Container build instructions

## Building the Image

You can build this image using the provided build script:
```bash
../scripts/build-nodejs-app.sh
```

The script will:
1. Build the container image
2. Tag it appropriately
3. Upload it to JFrog Artifactory
4. Apply security scanning and signing

## Security Considerations

This image demonstrates:
- Using official Node.js Alpine base image for minimal size
- Production-only dependency installation
- Multi-stage build process
- Proper handling of npm package files

## Testing

After building and running the container, you can test it by:
1. Accessing http://localhost:3000
2. Expected response: "Hello, World!"

## Development

To modify the application:
1. Update `app.js` with your changes
2. Add any new dependencies using `npm install --save`
3. Rebuild the container using the build script

## Notes

- This is a basic Express application intended for testing
- No SSL/TLS configuration is included
- Uses Alpine Linux for minimal attack surface
