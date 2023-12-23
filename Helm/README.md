# Helm Chart

## Prehľad
Tento Helm chart je navrhnutý na nasadenie škálovateľnej a konfigurovateľnej aplikácie s oddelenými frontendovými a backendovými komponentmi. Konfigurácia nasadenia pre každý komponent môže byť prispôsobená pomocou poskytnutých súborov s hodnotami: `values-fe.yaml` pre frontend a `values-be.yaml` pre backend.

## Inštrukcie na Nasadenie

Pre nasadenie backendových a frontendových komponentov aplikácie použite nasledujúce príkazy Helm:

1. Na odinštalovanie predchádzajúcich nasadení (ak existujú):
   ```
   helm uninstall backend -n `<namespace>`
   helm uninstall frontend -n `<namespace>`
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