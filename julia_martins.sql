-- Criação do MER--

-ENTIDADES:

carreiras, simulados, dicas, autores, entrevistas,
notícias, criadores.

-ATRIBUTOS:

Carreiras:
id_carreira (PK)
Título 
Descrição 
Data_Publicacao 

simulados:
id_simulado (PK)
titulo
duracao
nivel
link_questoes

dicas:
id_Dica (PK)      
Título
Resumo
url
id_autor (FK)

autores:
id_autor (PK)
Nome

entrevistas:
id_Entrada (PK)
Título
Resumo
Data_Publicacao
ID_Autor (FK)
url

noticias:
id_noticia (PK)
titulo
conteudo
data_publicacao
id_autor (FK)
url

criadores:
id_criador (PK)
nome
papel_grupo
habilidades
email
url

-Relacionamentos:
-- AUTORES - NOTÍCIAS
Um autor pode produzir várias notícias: (1, N)
Cada notícia é escrita por um único autor: (1, 1)

-- AUTORES - ENTREVISTAS
Um autor conduz várias entrevistas: (1, N)
Cada entrevista é conduzida por um único autor: (1, 1)

-- AUTORES - DICAS
Um autor pode criar várias dicas: (1, N)
Cada dica é criada por um vários autores: (1, N)

-- CRIADORES - SIMULADOS 
Um criador pode produzir vários simulados: (1, N)
Cada simulado é produzido por um único criador: (1, 1)

-- SIMULADOS - CARREIRAS
Um simulado pode ser utilizado em várias carreiras: (1, N)
Uma carreira pode utilizar vários simulados: (1, N)

--Criação da tabela autores
CREATE TABLE autores (
    id_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

INSERT INTO autores (nome) VALUES 
('Agda Aparecida Serpentini'),
('Alexandre Costa'),
('Débora Aladim'),
('Amanda de Souza'),
('Sara de Souza Costa');

SELECT * FROM autores;

-- Criação da tabela dicas
CREATE TABLE dicas (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    url  VARCHAR(255) NOT NULL,
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
)

INSERT INTO dicas (titulo, descricao, url, id_autor) VALUES
('Quais conteúdos devo estudar?', 'conteúdos importantes para estudar', 'http://127.0.0.1:5505/image/dicas/imgdicasUM.png', 3),
('Plano de estudos', 'cronograma de estudos', 'http://127.0.0.1:5505/image/dicas2/imagem%20dicas%2002.png', 4),
('Quais são os métodos de estudos?', 'dicas de métodos de estudos eficiente para melhorar o foco', 'http://127.0.0.1:5505/image/dicas03/banner.png', 1),
('O que não levar para o Enem?', 'saber o que pode ou não pode levar para o Enem', 'http://127.0.0.1:5505/image/dicas04/banner.png', 5),
('Planilha de estudos', 'organização dos dias da semana para estudar', 'http://127.0.0.1:5505/image/dicas05/planilha%20de%20estudos.jpg', 2),
('Relato de profissionais da área', 'relato de uma professora de historia', 'http://127.0.0.1:5505/image/dicas6/pngtree-principal-office-and-teachers-png-image_11672526-removebg-preview.png', 1);

SELECT * FROM dicas;

-- Consultas da tabela de dicas 
-- INNER JOIN (para obter uma lista de dicas que esteja relacionada a seus autores)

SELECT d.titulo, d.descricao, d.url, a.nome
FROM dicas d
JOIN autores a ON d.id_autor = a.id_autor;

