CREATE TABLE IF NOT EXISTS conversaciones_chatbot (
    id SERIAL PRIMARY KEY,
    chatID VARCHAR(255),
    username VARCHAR(255),
    mensajeUser TEXT,
    mensajeIA TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
