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



-- Criação da tabela dicas
CREATE TABLE dicas (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    img_url  VARCHAR(255) NOT NULL,
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
)


