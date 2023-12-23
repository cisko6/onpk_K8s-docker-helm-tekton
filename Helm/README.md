# Helm Chart for Your Application

## Overview
This Helm chart is designed to deploy a scalable and configurable application, with distinct frontend and backend components. The deployment configuration for each component can be customized using the provided values files: `values-fe.yaml` for the frontend and `values-be.yaml` for the backend.

## Deployment Instructions

To deploy the backend and frontend components of the application, use the following Helm commands:

1. To uninstall previous deployments (if any):
   ```
   helm uninstall backend -n helm
   helm uninstall frontend -n helm
   ```

2. To install the backend and frontend:
   ```
   helm install backend . --values .\values-be.yaml -n helm
   helm install frontend . --values .\values-fe.yaml -n helm
   ```

## Helm Repository Setup

To set up the Helm repository for this chart:

1. Enable GitHub Pages:
   - Navigate to the repository settings.
   - Go to the Pages section.
   - Set the source to `/root` or as required.

2. Package and index the Helm chart:
   ```
   helm package .
   helm repo index . --url https://github.com/cisko6/helm-chart --merge index.yaml
   ```

3. For users to add and use your Helm repository:
   ```
   helm repo add helm-chart https://cisko6.github.io/helm-chart
   helm search repo helm-chart
   helm install [release-name] helm-chart/[chart-name] --version [version]
   ```