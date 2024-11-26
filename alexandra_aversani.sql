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

--Criando o MER da tabela Simulado--

ENTIDADES:

- Simulados 

ATRIBUTOS:
- id (PK)
- titulo
- nivel
- link_questoes
- duracao


