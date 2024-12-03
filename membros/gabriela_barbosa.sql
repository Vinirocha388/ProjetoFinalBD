
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

-- Select que mostra a tabela Criadores com uma das 3 funções inseridas

SELECT c.nome AS criador, f.funcao , c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao;

-- Select que mostra apenas o Product Owner

SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Product Owner';

-- Select que mostra apenas o Scrum Master

SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Scrum Master';

-- Select que mostra os Membros Desenvolvedores

SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
WHERE f.funcao = 'Membro Desenvolvedor';


-- Select que mostra apenas nome e função

SELECT c.nome AS criador, f.funcao
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao;


-- Select que mostra tudo organizado da maior idade para a menor

SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
ORDER BY c.idade DESC;


-- Select que mostra tudo organizado os nomes em ordem alfabética

SELECT c.nome AS criador, f.funcao, c.idade, c.email
FROM Criadores c
JOIN FuncoesScrum f ON c.id_funcao = f.id_funcao
ORDER BY c.nome ASC;



