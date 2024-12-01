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
Data_Publicacao

autores:
id_autor (PK)
Nome

entrevistas:
id_Entrada (PK)
Título
Resumo
Data_Publicacao
ID_Autor (FK)

noticias:
id_noticia (PK)
titulo
conteudo
data_publicacao
id_autor (FK)

criadores:
id_criador (PK)
nome
papel_grupo
habilidades
email

-Relacionamentos:

-- Carreiras  ----  Autores
-- Uma carreira pode ser escrita por vários autores, e um autor pode contribuir para várias carreiras.
-- Simulados  ----  Criadores
-- Um simulado pode ser criado por vários criadores, e um criador pode criar vários simulados. (arrumar)

Dicas (N) ---- (1) Autores
Uma dica pode ser escrita por vários autores, e um autor pode contribuir para várias dicas.

Entrevistas (1) ---- (N) Autores
Uma entrevista pode ser realizada por vários autores, e um autor pode realizar várias entrevistas.

Notícias (1) ---- (N) Autores
Uma notícia pode ser escrita por vários autores, e um autor pode escrever várias notícias.

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

-- Criação da tabela dicas
CREATE TABLE dicas (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    img_url  VARCHAR(255) NOT NULL,
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
)

INSERT INTO dicas (titulo, descricao, img_url, id_autor) VALUES
('Quais conteúdos devo estudar?', 'conteúdos importantes para estudar', 'http://127.0.0.1:5505/image/dicas/imgdicasUM.png', 3),
('Plano de estudos', 'cronograma de estudos', 'http://127.0.0.1:5505/image/dicas2/imagem%20dicas%2002.png', 4),
('Quais são os métodos de estudos?', 'dicas de métodos de estudos eficiente para melhorar o foco', 'http://127.0.0.1:5505/image/dicas03/banner.png', 1),
('O que não levar para o Enem?', 'saber o que pode ou não pode levar para o Enem', 'http://127.0.0.1:5505/image/dicas04/banner.png', 5),
('Planilha de estudos', 'organização dos dias da semana para estudar', 'http://127.0.0.1:5505/image/dicas05/planilha%20de%20estudos.jpg', 2),
('Relato de profissionais da área', 'relato de uma professora de historia', 'http://127.0.0.1:5505/image/dicas6/pngtree-principal-office-and-teachers-png-image_11672526-removebg-preview.png', 1);
