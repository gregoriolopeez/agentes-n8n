# HITO 3 - Chatbot Multiherramienta

Proyecto del módulo Desarrollo de Agentes IA para Web - 2º DAW  
IES Hermenegildo Lanz

## Descripción

Este proyecto implementa un chatbot multiherramienta con n8n como orquestador visual.  
El sistema analiza la intención del usuario y decide qué herramienta utilizar para responder:

- OpenMeteo para clima
- REST Countries para información de países
- Wikipedia REST API para conocimiento general
- Ollama para generación de respuestas naturales
- PostgreSQL para persistencia del historial conversacional

## Tecnologías utilizadas

- n8n
- Ollama
- PostgreSQL
- APIs REST gratuitas
- Docker Compose

## Estructura del proyecto
```text
hito3-automatizacion/
├── docker/ 
├── n8n/workflows/
├── postgres/
├── tests/
├── docs/
├── .gitignore
└── README.md
```
## Estado actual

* [x] Estructura inicial creada
* [x] Base de datos inicial definida
* [ ] Docker Compose configurado
* [ ] Workflow exportado
* [ ] Tests completados
* [ ] Capturas añadidas
* [ ] Vídeo enlazado

## Autores
Proyecto realizado por:
- [Gregorio López]
- [Pablo Hernández]


---

## 3.7 `docker/docker-compose.yml`

```yaml
services:
  postgres:
    image: postgres:16
    container_name: chatbot_postgres
    restart: unless-stopped
    environment:
      POSTGRES_DB: ${POSTGRES_DB}
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    ports:
      - "${POSTGRES_PORT}:5432"
    volumes:
      - ../postgres/init.sql:/docker-entrypoint-initdb.d/init.sql
      - postgres_data:/var/lib/postgresql/data

  ollama:
    image: ollama/ollama:latest
    container_name: chatbot_ollama
    restart: unless-stopped
    ports:
      - "${OLLAMA_PORT}:11434"
    volumes:
      - ollama_data:/root/.ollama

  n8n:
    image: n8nio/n8n:latest
    container_name: chatbot_n8n
    restart: unless-stopped
    ports:
      - "${N8N_PORT}:5678"
    environment:
      DB_TYPE: postgresdb
      DB_POSTGRESDB_HOST: postgres
      DB_POSTGRESDB_PORT: 5432
      DB_POSTGRESDB_DATABASE: ${POSTGRES_DB}
      DB_POSTGRESDB_USER: ${POSTGRES_USER}
      DB_POSTGRESDB_PASSWORD: ${POSTGRES_PASSWORD}
      N8N_HOST: localhost
      N8N_PORT: 5678
      WEBHOOK_URL: http://localhost:${N8N_PORT}
      GENERIC_TIMEZONE: Europe/Madrid
    depends_on:
      - postgres
      - ollama
    volumes:
      - n8n_data:/home/node/.n8n

volumes:
  postgres_data:
  ollama_data:
  n8n_data:
````
---