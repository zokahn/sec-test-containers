# Flask Web Application Container

This container runs a simple Flask web application that serves a "Hello, World!" message. It's built using Python 3.9 and the Flask web framework.

## Container Details

- Base Image: python:3.9-slim
- Application Framework: Flask
- Exposed Port: 5000
- Working Directory: /app

## Application Structure

```
flask-app/
├── Dockerfile
├── app.py
└── requirements.txt
```

- `app.py`: Main application file containing the Flask web server
- `requirements.txt`: Python package dependencies
- `Dockerfile`: Container build instructions

## Building the Image

You can build this image using the provided build script:
```bash
../scripts/build-flask-app.sh
```

The script will:
1. Build the container image
2. Tag it appropriately
3. Upload it to JFrog Artifactory
4. Apply security scanning and signing

## Security Considerations

This image demonstrates:
- Using official Python slim base image
- Minimal dependencies
- No root user requirement
- Clear separation of dependency installation and code copying

## Testing

After building and running the container, you can test it by:
1. Accessing http://localhost:5000
2. Expected response: "Hello, World!"

## Development

To modify the application:
1. Update `app.py` with your changes
2. Add any new dependencies to `requirements.txt`
3. Rebuild the container using the build script

## Notes

- This is a basic Flask application intended for testing
- No production-grade WSGI server is included
- No SSL/TLS configuration is included
