
-- Criando a tabela autores --

CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nome_id_autor VARCHAR(100) NOT NULL,
    descricao_id_autor VARCHAR(100) NOT NULL,
    cargo_id_autor VARCHAR(100) NOT NULL
)

-- Criando Inserts para a tabela autores  --

INSERT INTO autores (nome_id_autor) VALUES 
('Nathalia Santos Ferreira', 'Tenho 17 anos' , 'Desenvolvedora de software'),
('Gabriela Fernanda' 'Tenho 17 anos' , 'Desenvolvedora de software'),
('Julia Arruda', 'Tenho 17 anos' , 'Desenvolvedora de software'),
('Mateus Marcelino' 'Tenho 17 anos' , 'Desenvolvedor de software'),
('Vinicius Rocha', 'Tenho 17 anos' , 'PO'),
('Alexandra Aversani', 'Tenho 17 anos' , 'scrum master'),


