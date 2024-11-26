-- Criando a tabela autores --

CREATE TABLE autores (
    id_participante SERIAL PRIMARY KEY,
    nome_participante VARCHAR(100) NOT NULL
)

-- Criando Inserts para a tabela autores  --

INSERT INTO autores (nome_participante) VALUES 
('Nathalia Santos Ferreira'),
('Gabriela Fernanda'),
('Julia Arruda'),
('Mateus Marcelino'),
('Vinicius Rocha'),
('Alexandra Aversani');


