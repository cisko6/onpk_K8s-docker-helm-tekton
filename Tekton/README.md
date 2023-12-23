
# Tekton CI/CD for Helm Chart Deployment

## Overview
This Tekton CI/CD setup is designed to automate the deployment process for both the frontend and backend components of the Helm chart provided earlier. It includes configurations for pipeline runs and a universal pipeline applicable to both components.

## Files Description
1. `backend-pipeline-run.yaml` - Pipeline run configuration for the backend.
2. `docker-credentials.yaml` - Contains Docker credentials for registry access.
3. `frontend-pipeline-run.yaml` - Pipeline run configuration for the frontend.
4. `universal-pipeline.yaml` - A universal pipeline used by both frontend and backend.

## Installation

To install Tekton pipelines and dashboard, use the following commands:

- Install Tekton pipelines:
  ```
  kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
  ```
- Install Tekton dashboard:
  ```
  kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml
  ```
- Install Tekton CLI (tkn) on Windows:
  ```
  choco install tektoncd-cli
  ```

## Starting the Dashboard

To start the Tekton dashboard, use one of the following methods:

- Freezed window (keeps the window open):
  ```
  kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097
  ```
- Continue using the command line without freezing the window:
  ```
  Start-Process kubectl -ArgumentList "--namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097" -NoNewWindow
  ```

## Running the Pipeline

To deploy your application using the Tekton pipeline, apply your pipeline configuration and start the pipeline:

1. Apply your pipeline configuration:
   ```
   kubectl apply -f your-pipeline.yaml
   ```

2. Start the pipeline:
   ```
   tkn pipeline start <pipeline-name> -n <namespace>
   ```
