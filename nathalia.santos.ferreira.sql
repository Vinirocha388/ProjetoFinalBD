-- Criação da tabela autor --

CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL
)

-- Create inserts for the author table --
-- Criando Inserts para a tabela autor --

INSERT INTO autores (nome_autor) VALUES 
('Nathalia Santos Ferreira'),
('Agda Serpentine'),
('Gabriela Fernanda'),
('Julia Arruda');


