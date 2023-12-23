# Docker nastavenie pre Backend a Frontend

Tento repozitár obsahuje Docker konfigurácie pre backend a frontend časti našej aplikácie.

## Backend

Backend je zostrojený pomocou Golang a je kontajnerizovaný pomocou Dockeru.

### Vysvetlenie Dockerfile

- **Base Image**: Začína s obrazom `golang:alpine` ako základný obraz pre zostavenie aplikácie.
- **Building the App**: Kopíruje kód aplikácie do kontajnera a zostavuje statický binárny súbor s názvom `main`.
- **Final Image**: Pre finálne zostavenie sa používa obraz `scratch` (veľmi malý základný obraz), ktorý obsahuje iba zostavenú aplikáciu.
- **Port**:  Kontajner vystavuje port `9080`.
- **Entrypoint**: Skompilovaný binárny súbor `./main` je nastavený ako vstupný bod.

### Vytvorenie imagu Docker

  ```sh
  docker build -t '<názov_imagu>' .
  docker build -t 'backend' .
  ```

### Spustenie kontajnera Docker

  ```sh
  docker run '<názov_imagu>'
  docker run backend
  ```

## Frontend

Frontend je aplikácia Node.js, ktorá je poskytovaná pomocou Nginx vo svojom Docker kontajneri.

### Dockerfile Vysvetlenie

- **Build Stage**: Používa `node:12-alpine` ako základný obraz. Inštaluje závislosti a zostavuje aplikáciu.
- **Final Stage**: Používa `nginx:stable-alpine` ako základný obraz na poskytovanie aplikácie. Kopíruje zostavenú aplikáciu zo predchádzajúcej fázy. Nastavuje Nginx na poskytovanie aplikácie.
- **Port**: Kontajner vystavuje port `8080`.
- **Entrypoint**: Vlastný skript na nastavenie premenných prostredia a spustenie `Nginx`.

### Vytvorenie imagu Docker

  ```sh
  docker build -t '<názov_imagu>' .
  docker build -t 'frontend' .
  ```

### Spustenie kontajnera Docker

  ```sh
  docker run -p '<port>':'<port>' '<názov_imagu>'
  docker run -p 8080:8080 frontend
  ```
