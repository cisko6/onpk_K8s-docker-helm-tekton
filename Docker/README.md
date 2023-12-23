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

- **Plan pre konkrétny zdroj**: 
  ```sh
  terraform <plan/apply/destroy> -target='<názov_targetu>'
  terraform apply -target='openstack_compute_instance_v2.minikube_instance'

### Building the Docker Image

  ```sh
  docker build -t '<názov_imagu>' .
  docker build -t 'backend' .
  ```

### Running the Docker Container

  ```sh
  docker run '<názov_imagu>'
  docker run backend
  ```

## Frontend

The frontend is a Node.js application, which is served using Nginx in its Docker container.

### Dockerfile Explained

- **Build Stage**: Uses `node:12-alpine` as the base image. Installs dependencies and builds the application.
- **Final Stage**: Uses `nginx:stable-alpine` as the base image for serving the application. Copies the built application from the previous stage. Sets up Nginx to serve the application.
- **Port**: The container exposes port `8080`.
- **Entrypoint**: Custom script to set environment variables and start Nginx.

### Building the Docker Image

  ```sh
  docker build -t '<názov_imagu>' .
  docker build -t 'frontend' .
  ```

### Running the Docker Container

  ```sh
  docker run -p '<port>':'<port>' '<názov_imagu>'
  docker run -p 8080:8080 frontend
  ```
