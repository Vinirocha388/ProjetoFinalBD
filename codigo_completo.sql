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


-- Querys para criação das tabelas

CREATE DATABASE site_historia;
\c site historia;

CREATE TABLE Carreiras (
    id_carreira SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT,
);


INSERT INTO carreiras (titulo, descricao) VALUES
('Pesquisa Acadêmica', 'Pesquisadores acadêmicos dedicam-se ao estudo aprofundado em áreas específicas, produzindo artigos, trabalhos e avaliações e análises científicas.'),
('Arqueologia', 'A arqueologia envolve o estudo de civilizações antigas através da excavação e análise de artefatos.'),
('Jornalismo e Comunicação', 'Jornalistas e comunicadores trabalham na coleta, redação e transmissão de notícias e informações.'),
('Consultoria Histórica', 'Consultores históricos ajudam a fornecer contextos e a aconselhamento em projetos que prezam a pesquisa histórica.'),
('Gestão de Patrimônio', 'Gestores de patrimônio cultural se responsabilizam por preservar, gerenciar e promover o patrimônio histórico e cultural.');

--Criando a tabela Simulado--
CREATE TABLE Simulado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    nivel INT NOT NULL,
    link_questoes TEXT NOT NULL,
    duracao TIME NOT NULL,
);

--Inserts para a tabela Simulado--
INSERT INTO Simulado (titulo, nivel, link_questoes, duracao) VALUES
('Simulado Nível 1', 1, 'https://www.jotform.com/form/243036863744057', '02:00:00'),
('Simulado Nível 2', 2, 'https://www.jotform.com/form/243037604836053', '03:00:00'),
('Simulado Nível 3', 3, 'https://www.jotform.com/form/243036925762056', '04:00:00'),
('Simulado Nível 4', 4, 'https://www.jotform.com/form/243037164246049', '05:00:00'),
('Simulado Nível 5', 5, 'https://www.jotform.com/form/243036947508058', '06:00:00'),
('Teste suas Capacidades', 0, 'https://cursoenemgratuito.com.br/simulado-geral-de-historia-para-o-enem/', '07:00:00');


CREATE TABLE Criadores (
    id_criador INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    papel_grupo VARCHAR(255),
    habilidades TEXT,
    email VARCHAR(255) 
);

-- Criando Inserts para a tabela autores  --

INSERT INTO Criadores (id_criador, nome, papel_grupo, habilidades, email) VALUES 
('1', 'Vinicius Rocha' , 'Product Owner', 'Codar, gerir' , 'vinicius.a.rocha8@aluno.senai.br'),
('2', 'Alexandra Aversani' , 'Scrum Master', 'Codar, gerir' , 'alexandra.aversani@aluno.senai.br'),
('3', 'Gabriela Barbosa' , 'Membro Desenvolvedor', 'Codar' , 'gabriela.f.barbosa@aluno.senai.br'),
('4', 'Julia Martins' , 'Membro Desenvolvedor', 'Codar' , 'Julia.martins7@aluno.senai.br'),
('5', 'Matheus Marcelino' , 'Membro Desenvolvedor', 'Codar' , 'mateus.marcelino@aluno.senai.br'),
('6', 'Nathalia Santos' , 'Membro Desenvolvedor', 'Codar' , 'nathalia.ferreira7629@gmail.com');


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

