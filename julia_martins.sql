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
quantidade-questao

dicas:
id_dica (PK)      |
descricao
titulo
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
-- fazer depois


-- criando tabelas dicas --
CREATE TABLE dicas (
    id_dica SERIAL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    id_autor INT NOT NULL
)


