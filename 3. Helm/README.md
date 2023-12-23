# Helm Chart

## Prehľad
Tento Helm chart je navrhnutý na nasadenie škálovateľnej a konfigurovateľnej aplikácie s oddelenými frontendovými a backendovými komponentmi. Konfigurácia nasadenia pre každý komponent môže byť prispôsobená pomocou poskytnutých súborov s hodnotami: `values-fe.yaml` pre frontend a `values-be.yaml` pre backend.

## Inštrukcie na Nasadenie

Pre nasadenie backendových a frontendových komponentov aplikácie použite nasledujúce príkazy Helm:

1. Na odinštalovanie predchádzajúcich nasadení (ak existujú):
   ```
   helm uninstall backend -n <namespace>
   helm uninstall frontend -n <namespace>
   ```

2. Na inštaláciu backendu a frontendu:
   ```
   helm install backend . --values .\values-be.yaml -n <namespace>
   helm install frontend . --values .\values-fe.yaml -n <namespace>
   ```

## Nastavenie Helm Repozitára

Pre nastavenie Helm repozitára pre tento chart:

1. Zapnite GitHub Pages:
   - Prejdite do nastavení repozitára.
   - Prejdite do sekcie Pages.
   - Nastavte zdroj na `/root` alebo podľa potreby.

2. Zbaľte a indexujte Helm chart:
   ```
   helm package .
   helm repo index . --url <your-github-repository> --merge index.yaml
   ```

3. Aby užívatelia mohli pridať a používať váš Helm repozitár:
   ```
   helm repo add <repository-name> <repository-url>
   helm search repo
   helm install <release-name> <repository-name>/<chart-name> --version [version]
   ```
