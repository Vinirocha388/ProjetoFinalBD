-- Criação do MER--

-ENTIDADES:

carreiras, simulados, dicas, autores, entrevistas,
notícias, criadores, FuncoesScrum. 

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

FuncoesScrum:
id_funcao PK
funcao

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
);

INSERT INTO dicas (titulo, descricao, url, id_autor) VALUES
('Quais conteúdos devo estudar?', 'Civilizações Mesopotâmicas, Egito Antigo, Grécia Antiga, Roma Antiga, Renascimento Cultural, 
Civilizações Mesopotâmicas, Egito Antigo, Grécia Antiga, Roma Antiga, Renascimento Cultural', 'http://127.0.0.1:5505/image/dicas/imgdicasUM.png', 3),
('Plano de estudos', 'Um bom planejamento de estudo é essencial para gerenciar o tempo e priorizar as matérias mais difíceis, 
especialmente no início, quando você está mais disposto. Foque nos principais assuntos e busque um entendimento 
profundo, não apenas decorar. Alterne os conteúdos para facilitar o aprendizado e garantir que o conhecimento 
seja útil a longo prazo.', 'http://127.0.0.1:5505/image/dicas2/imagem%20dicas%2002.png', 4),
('Quais são os métodos de estudos?', 'A organização melhora o foco e a eficiência nos estudos, enquanto metas claras aumentam a motivação. 
Monitorar o progresso reduz o estresse e melhora a retenção. 
A técnica das três colunas (anotações, tópicos e resumo) ajuda a organizar e conectar as informações, otimizando o 
tempo e o desempenho nas provas.', 'http://127.0.0.1:5505/image/dicas03/banner.png', 1),
('O que levar para o Enem?', 'Leve um documento com foto, caneta preta transparente, máscara de proteção, água, lanches leves, 
roupas confortáveis e um relógio simples (verifique as regras). O cartão de inscrição é recomendado, 
e lápis e borracha são úteis para rascunhos. Se necessário, leve medicamentos e outros itens pessoais. 
O caderno de questões pode ser levado após o horário de saída permitido.', 'http://127.0.0.1:5505/image/dicas04/banner.png', 5),
('Planilha de estudos', 'organização dos dias da semana para estudar', 'http://127.0.0.1:5505/image/dicas05/planilha%20de%20estudos.jpg', 2),
('Relato de profissionais da área', 'relato de uma professora de historia', 'http://127.0.0.1:5505/image/dicas6/pngtree-principal-office-and-teachers-png-image_11672526-removebg-preview.png', 1);




SELECT * FROM dicas;

-- Consultas da tabela de dicas


-- UPDATE (atualizar o nome do autor que esta no id 2)
UPDATE autores SET nome = 'Nathalia Ferreira' WHERE id_autor = 2;


-- UPDATE (atualizar o nome do autor que esta no id 2)
UPDATE autores SET nome = 'Nathalia Ferreira' WHERE id_autor = 2;

-- INNER JOIN (para obter uma lista de dicas que esteja relacionada a seus autores)
SELECT d.titulo, d.descricao, d.url, a.nome
FROM dicas d
JOIN autores a ON d.id_autor = a.id_autor;

-- INNER JOIN (Exibir lista de uma autora específica)
SELECT d.titulo, d.descricao, d.url
FROM dicas d
JOIN autores a ON d.id_autor = a.id_autor
WHERE a.nome = 'Agda Aparecida Serpentini';

-- DELETE (deletar autor que está no id 5)
DELETE FROM dicas WHERE id_autor = 5;
DELETE FROM autores WHERE id_autor = 5;



