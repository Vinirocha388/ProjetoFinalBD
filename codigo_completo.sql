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

-- FUNÇÕES SCRUM - CRIADORES
 Um criador poder ter no minimo 1 e no maximo 1 função: (1, 1)
 Uma função tem no minimo 1 e no maximo N criador: (1, N);



-- Querys para criação das tabelas

CREATE DATABASE site_historia;
\c site_historia;

CREATE TABLE carreiras (
    id_carreira SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT
);

INSERT INTO carreiras (titulo, descricao) VALUES
('Pesquisa Acadêmica', 'Pesquisadores acadêmicos dedicam-se ao estudo aprofundado em áreas específicas, produzindo artigos, trabalhos e avaliações e análises científicas.'),
('Arqueologia', 'A arqueologia envolve o estudo de civilizações antigas através da excavação e análise de artefatos.'),
('Jornalismo e Comunicação', 'Jornalistas e comunicadores trabalham na coleta, redação e transmissão de notícias e informações.'),
('Consultoria Histórica', 'Consultores históricos ajudam a fornecer contextos e a aconselhamento em projetos que prezam a pesquisa histórica.'),
('Gestão de Patrimônio', 'Gestores de patrimônio cultural se responsabilizam por preservar, gerenciar e promover o patrimônio histórico e cultural.');

CREATE TABLE simulado (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    nivel INT NOT NULL,
    link_questoes TEXT NOT NULL,
    duracao TIME NOT NULL
);

INSERT INTO simulado (titulo, nivel, link_questoes, duracao) VALUES
('Simulado Nível 1', 1, 'https://www.jotform.com/form/243036863744057', '02:00:00'),
('Simulado Nível 2', 2, 'https://www.jotform.com/form/243037604836053', '03:00:00'),
('Simulado Nível 3', 3, 'https://www.jotform.com/form/243036925762056', '04:00:00'),
('Simulado Nível 4', 4, 'https://www.jotform.com/form/243037164246049', '05:00:00'),
('Simulado Nível 5', 5, 'https://www.jotform.com/form/243036947508058', '06:00:00'),
('Teste suas Capacidades', 0, 'https://cursoenemgratuito.com.br/simulado-geral-de-historia-para-o-enem/', '07:00:00');

SELECT titulo, duracao 
FROM simulado
WHERE duracao > '03:00:00';



 CREATE TABLE FuncoesScrum (
    id_funcao SERIAL PRIMARY KEY,
    funcao VARCHAR (200) UNIQUE NOT NULL
 );

INSERT INTO FuncoesScrum (funcao) VALUES 
('Product Owner'), 
('Scrum Master'),
('Membro Desenvolvedor');

SELECT * FROM FuncoesScrum;

 CREATE TABLE Criadores (
    id_criador SERIAL PRIMARY KEY,
    id_funcao INT NOT NULL,
    nome VARCHAR (200) NOT NULL,
    idade INT NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    fotoUrl VARCHAR(500) UNIQUE,
    CONSTRAINT fk_funcao
        FOREIGN KEY (id_funcao)
        REFERENCES FuncoesScrum (id_funcao)
 );

INSERT INTO Criadores (id_funcao , nome , idade, email, fotoUrl ) VALUES 
('1', 'Vinicius Rocha' , 17 , 'vinicius.a.rocha8@aluno.senai.br', 'https://site-historia-six.vercel.app/image/sobre/integrantes/Rocha.png'),
('2', 'Alexandra Aversani' , 17 , 'alexandra.aversani@aluno.senai.br', 'https://site-historia-six.vercel.app/image/sobre/integrantes/Alexandra.png'),
('3', 'Gabriela Barbosa' , 17 , 'gabriela.f.barbosa@aluno.senai.br', 'https://site-historia-six.vercel.app/image/sobre/integrantes/Gabi.png'),
('3', 'Julia Martins' , 16 , 'Julia.martins7@aluno.senai.br', 'https://site-historia-six.vercel.app/image/juls.jfif'),
('3', 'Matheus Marcelino' , 17 , 'mateus.marcelino@aluno.senai.br', 'https://site-historia-six.vercel.app/image/sobre/integrantes/marcelino.png'),
('3', 'Nathalia Santos' , 17 , 'nathalia.ferreira7629@gmail.com', 'https://site-historia-six.vercel.app/image/sobre/integrantes/Nathalia.png');



SELECT c.nome AS criador, f.funcao , c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao;


SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Product Owner';


SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Scrum Master';


SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Membro Desenvolvedor';


SELECT c.nome AS criador, f.funcao
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao;


SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
ORDER BY c.idade DESC;


SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
ORDER BY c.nome ASC;

-- Seleciona o criador mais velho
SELECT c.nome, f.funcao, c.idade
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE c.idade >= 17;



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

INSERT INTO autores (nome)
VALUES ('Novo Autor');


CREATE TABLE dicas (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    conteudo TEXT,
    url  VARCHAR(255) NOT NULL,
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

INSERT INTO dicas (titulo, conteudo, url, id_autor) VALUES
('Quais conteúdos devo estudar?', 'História Antiga, História Medieval,História Moderna, História Contemporânea', 'http://127.0.0.1:5505/image/dicas/imgdicasUM.png', 3),
('Plano de estudos', 'cronograma de estudos', 'http://127.0.0.1:5505/image/dicas2/imagem%20dicas%2002.png', 4),
('Quais são os métodos de estudos?', 'Mapa mental, Resumos, Técnica Pomodoro, A auto explicação e a auto interrogação, Mnemônica, Jogos, Anotações Cornell', 'http://127.0.0.1:5505/image/dicas03/banner.png', 1),
('O que não levar para o Enem?', 'Aparelhos Eletrônicos, Livros e Anotações, Bonés, Chapéus e Óculos Escuros, Relógios Inteligentes', 'http://127.0.0.1:5505/image/dicas04/banner.png', 5),
('Planilha de estudos', 'organização dos dias da semana para estudar', 'http://127.0.0.1:5505/image/dicas05/planilha%20de%20estudos.jpg', 2),
('Planilha de estudos-Humanas', 'Cronograma Completo, Conteúdos mais cobrados, divisão dos conteudos,importância de estudar', 'http://127.0.0.1:5505/image/dicas6/pngtree-principal-office-and-teachers-png-image_11672526-removebg-preview.png', 1);

SELECT * FROM dicas;
SELECT titulo, url 
FROM dicas;


-- INNER JOIN (para obter uma lista de dicas que esteja relacionada a seus autores)
SELECT d.titulo, d.conteudo, d.url, a.nome
FROM dicas d
JOIN autores a ON d.id_autor = a.id_autor;


CREATE TABLE noticias (
    id_noticia SERIAL PRIMARY KEY,
    titulo VARCHAR(100) UNIQUE NOT NULL,
    conteudo TEXT NOT NULL,
    data_publicacao DATE NOT NULL,
    id_autor INT NOT NULL
);

INSERT INTO noticias (titulo, conteudo, data_publicacao, id_autor) VALUES 
('Faculdades da região de São Paulo abrem vagas para inscrições', 'Conteúdo da notícia 1', '2021-01-01', 1),
('Novos registros históricos são encontrados', 'Conteúdo da notícia 2', '2021-01-02', 2),
('Como é o curso de História?', 'Conteúdo da notícia 3', '2021-01-03', 3);

SELECT titulo, conteudo, data_publicacao 
FROM noticias
WHERE data_publicacao < '2022-01-01';


-- Procura o nome do autor com a entrevista
SELECT n.titulo, n.conteudo, n.data_publicacao, a.nome AS autor
FROM noticias n
JOIN autores a ON n.id_autor = a.id_autor;

