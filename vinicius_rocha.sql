-- MER
-ATRIBUTOS:

Carreiras:
id_carreira (PK)
Título 
Descrição 
Data_Publicacao

CREATE TABLE Carreiras (
    id_carreira SERIAL PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Descricao TEXT,
    Data_Publicacao DATE NOT NULL
);


