CREATE TABLE IF NOT EXISTS conversaciones_chatbot (
    id SERIAL PRIMARY KEY,
    mensaje_usuario TEXT NOT NULL,
    intencion_detectada VARCHAR(50) NOT NULL,
    herramienta_usada VARCHAR(50) NOT NULL,
    respuesta_bot TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_conversaciones_fecha
ON conversaciones_chatbot(fecha DESC);