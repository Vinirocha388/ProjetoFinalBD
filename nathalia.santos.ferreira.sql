-- Criando a tabela autor --

CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL
)

-- Criando Inserts para a tabela autor --

INSERT INTO autores (nome_autor) VALUES 
('Nathalia Santos Ferreira'),
('Agda Serpentine'),
('Gabriela Fernanda'),
('Julia Arruda');

-- Criando o MER da tabela de autores--

ENTIDADES:

- autores

ATRIBUTOS:

- id_autor (PK)
- nome_autor

-- Criando a tabela notícias --

CREATE TABLE noticias (
    id_noticia SERIAL PRIMARY KEY,
    titulo VARCHAR(100) UNIQUE NOT NULL,
    conteudo TEXT NOT NULL,
    data_publicacao DATE NOT NULL,
    id_autor INT NOT NULL
)

-- Criando Inserts para a tabela notícias --

INSERT INTO noticias (titulo, conteudo, data_publicacao, id_autor) VALUES 
('Faculdades da região de São Paulo abrem vagas para inscrições', 'Conteúdo da notícia 1', '2021-01-01', 1),
('Novos registros históricos são encontrados', 'Conteúdo da notícia 2', '2021-01-02', 2),
('Como é o curso de História?', 'Conteúdo da notícia 3', '2021-01-03', 3);

-- Criando o MER da tabela de notícias--

ENTIDADES:

- noticias

ATRIBUTOS:

- id_noticia (PK)
- titulo
- conteudo
- data_publicacao
- id_autor (FK)

-- Criando a tabela entrevistas --

CREATE TABLE entrevistas (
    id_entrevista SERIAL PRIMARY KEY,
    id_autor INT NOT NULL,
    titulo VARCHAR(100) UNIQUE NOT NULL,
    link_video VARCHAR(100) NOT NULL,
    duracao TIME NOT NULL
)


