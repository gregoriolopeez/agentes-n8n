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