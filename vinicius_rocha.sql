-- MER
-ATRIBUTOS:

Carreiras:
id_carreira (PK)
Título 
Descrição 

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

