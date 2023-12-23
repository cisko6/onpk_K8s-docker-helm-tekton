# Docker Setup for Backend and Frontend

This repository contains the Docker configurations for both the backend and frontend components of our application.

## Backend

The backend is built using Golang and is containerized using Docker.

### Dockerfile Explained

- **Base Image**: Starts with `golang:alpine` as the base image for building the application.
- **Building the App**: Copies the application code into the container and builds a static binary named `main`.
- **Final Image**: Uses a `scratch` image (a very small base image) for the final build, containing only the compiled application.
- **Port**: The container exposes port `9080`.
- **Entrypoint**: The compiled binary `./main` is set as the entrypoint.

#### Building the Docker Image

```sh
docker build -t myapp-backend .