
# Tekton CI/CD pre Nasadenie Helm Chart

## Prehľad
Táto konfigurácia Tekton CI/CD je navrhnutá na automatizáciu procesu nasadenia pre frontendové a backendové komponenty Helm chartu poskytnutého skôr. Obsahuje konfigurácie pre behy pipeline a univerzálnu pipeline použiteľnú pre oba komponenty.

## Popis Súborov
1. `backend-pipeline-run.yaml` - Konfigurácia behu pipeline pre backend.
2. `docker-credentials.yaml` - Obsahuje prihlasovacie údaje Docker pre prístup k registru.
3. `frontend-pipeline-run.yaml` - Konfigurácia behu pipeline pre frontend.
4. `universal-pipeline.yaml` - Univerzálna pipeline používaná frontendom aj backendom.

## Inštalácia

Na inštaláciu Tekton pipelines a dashboardu použite nasledujúce príkazy:

- Inštalácia Tekton pipelines:
  ```
  kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
  ```
- Inštalácia Tekton dashboardu:
  ```
  kubectl apply --filename https://storage.googleapis.com/tekton-releases/dashboard/latest/release.yaml
  ```
- Inštalácia Tekton CLI (tkn) na Windows:
  ```
  choco install tektoncd-cli
  ```

## Spustenie Dashboardu

Na spustenie Tekton dashboardu použite jednu z nasledujúcich metód:

- Zamrznuté okno (udrží okno otvorené):
  ```
  kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097
  ```
- Pokračovanie v používaní príkazového riadku bez zamrznutia okna:
  ```
  Start-Process kubectl -ArgumentList "--namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097" -NoNewWindow
  ```

## Spustenie Pipeline

Na nasadenie vašej aplikácie pomocou Tekton pipeline aplikujte vašu konfiguráciu pipeline a spustite pipeline:

1. Aplikujte vašu konfiguráciu pipeline:
   ```
   kubectl apply -f your-pipeline.yaml
   ```

2. Spustite pipeline:
   ```
   tkn pipeline start <meno-pipeline> -n <namespace>
   ```
