CREATE TABLE pais (
    id_pais   NUMBER PRIMARY KEY,
    nome_pais VARCHAR2(50) NOT NULL
);

CREATE TABLE estado (
    id_estado   NUMBER PRIMARY KEY,
    nome_estado VARCHAR2(30) NOT NULL,
    id_pais     NUMBER
);

ALTER TABLE estado
    ADD CONSTRAINT fk_estado FOREIGN KEY ( id_pais )
        REFERENCES pais ( id_pais );
        
        
CREATE TABLE cidade (
    id_cidade   NUMBER PRIMARY KEY,
    nome_cidade VARCHAR2(30) NOT NULL,
    id_estado   NUMBER
);

ALTER TABLE cidade
    ADD CONSTRAINT fk_cidade FOREIGN KEY ( id_estado )
        REFERENCES estado ( id_estado );
        
      CREATE TABLE bairro (
    id_bairro   NUMBER PRIMARY KEY,
    nome_bairro VARCHAR2(30) NOT NULL,
    id_cidade   NUMBER
);

ALTER TABLE bairro
    ADD CONSTRAINT fk_bairro FOREIGN KEY ( id_cidade )
        REFERENCES cidade ( id_cidade );
