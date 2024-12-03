--Criando a tabela Simulado--
CREATE TABLE Simulado (
    id SERIAL PRIMARY KEY,
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


--Select que retorna todos os simulados de um nível específico--

SELECT * FROM Simulados WHERE nivel = 2;

--Select que conta quantos simulados existem na tabela--

SELECT COUNT(*) AS total_simulados FROM Simulado;

--Select que exibe simulados com duração superior a 3 horas--

SELECT * FROM Simulado WHERE duracao > '03:00:00';

--Delete que remove um simulado específico usando ID--

DELETE FROM Simulado WHERE id = 3;

--Delete que remove todos os simulados com nível igual a 5--

DELETE FROM Simulado WHERE nivel = 5;


--Criando o MER da tabela Simulado--

ENTIDADES:

- Simulados 

ATRIBUTOS:
- id (PK)
- titulo
- nivel
- link_questoes
- duracao


