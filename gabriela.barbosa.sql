-- Mer --

ENTIDADES

- Criadores

ATRIBUTOS 

- id (PK)
- nome
- idade
- função/papel no grupo 
- habilidades
- email

 RELACIONAMENTOS 

 X

-- SQL

-- Criando a tabela autores --

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
('6', 'Nathalia Santos' , 'Membro Desenvolvedor', 'Codar' , 'nathalia.ferreira7629@gmail.com')


-- 2 --

 MER 

--ENTIDADES--

FuncoesScrum 
Ciadores

--ATRIBUTOS--

FuncoesScrum:
 - id_funcao PK
 - funcao

Criadores:
 - id PK
 - id_funcao FK
 - nome 
 - idade
 - habilidades
 - email 

 -- Relacionamentos --

 Um criador tem no minimo 1 e no maximo 1 função
 Uma função tem no minimo 1 e no maximo N criador;

 -- SQL --

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
    habilidades TEXT,
    email VARCHAR(200) UNIQUE NOT NULL,
    CONSTRAINT fk_funcao
        FOREIGN KEY (id_funcao)
        REFERENCES FuncoesScrum (id_funcao)
 );


INSERT INTO Criadores (id_funcao , nome , idade , habilidades, email ) VALUES 
('1', 'Vinicius Rocha' , 17 , 'Codar, gerir' , 'vinicius.a.rocha8@aluno.senai.br'),
('2', 'Alexandra Aversani' , 17 , 'Codar, gerir' , 'alexandra.aversani@aluno.senai.br'),
('3', 'Gabriela Barbosa' , 17 , 'Codar' , 'gabriela.f.barbosa@aluno.senai.br'),
('3', 'Julia Martins' , 16 , 'Codar' , 'Julia.martins7@aluno.senai.br'),
('3', 'Matheus Marcelino' , 17 , 'Codar' , 'mateus.marcelino@aluno.senai.br'),
('3', 'Nathalia Santos' , 17 , 'Codar' , 'nathalia.ferreira7629@gmail.com');

-- Select que mostra a tabela Criadores com uma das 3 funções inseridas

SELECT c.nome AS criador, f.funcao , c.idade, c.habilidades, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao;


-- Select que mostra apenas o Scrum Master

SELECT c.nome AS criador, f.funcao, c.idade, c.habilidades, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Scrum Master';


-- Select que mostra apenas o Product Owner

SELECT c.nome AS criador, f.funcao, c.idade, c.habilidades, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Product Owner';


-- Select que mostra os Membros Desenvolvedores

SELECT c.nome AS criador, f.funcao, c.idade, c.habilidades, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Membro Desenvolvedor';


-- Select que mostra apenas nome e função

SELECT c.nome AS criador, f.funcao
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao;


-- Select que mostra tudo organizado da maior idade para a menor

SELECT c.nome AS criador, f.funcao, c.idade, c.habilidades, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
ORDER BY c.idade DESC;


-- Select que mostra tudo organizado os nomes em ordem alfabética

SELECT c.nome AS criador, f.funcao, c.idade, c.habilidades, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
ORDER BY c.nome ASC;



