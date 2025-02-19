CREATE TABLE pais (
    id_pais   NUMBER PRIMARY KEY,
    nome_pais VARCHAR2(50) NOT NULL
);

CREATE TABLE estado (
    id_estado   NUMBER PRIMARY KEY,
    nome_estado VARCHAR2(30) NOT NULL,
    id_pais     NUMBER NOT NULL,
    CONSTRAINT fk_estado FOREIGN KEY (id_pais) REFERENCES pais (id_pais)
);

CREATE TABLE cidade (
    id_cidade   NUMBER PRIMARY KEY,
    nome_cidade VARCHAR2(30) NOT NULL,
    id_estado   NUMBER NOT NULL,
    CONSTRAINT fk_cidade FOREIGN KEY (id_estado) REFERENCES estado (id_estado)
);

CREATE TABLE bairro (
    id_bairro   NUMBER PRIMARY KEY,
    nome_bairro VARCHAR2(30) NOT NULL,
    id_cidade   NUMBER NOT NULL,
    CONSTRAINT fk_bairro FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade)
);

-- ==========================
-- TABELAS DE ENDEREÇO
-- ==========================

CREATE TABLE logradouro (
    id_log        NUMBER PRIMARY KEY,
    descricao_log VARCHAR2(50) NOT NULL
);

CREATE TABLE endereco (
    id_endereco   NUMBER PRIMARY KEY,
    logradouro    VARCHAR2(50) NOT NULL,
    numero        NUMBER NOT NULL,
    cep           NUMBER NOT NULL,
    complemento   VARCHAR2(50),
    referencia    VARCHAR2(50),
    id_bairro     NUMBER NOT NULL,
    id_log        NUMBER NOT NULL, -- Relacionando com Tipo_Logradouro
    CONSTRAINT fk_endereco_bairro FOREIGN KEY (id_bairro) REFERENCES bairro (id_bairro),
    CONSTRAINT fk_endereco_log FOREIGN KEY (id_log) REFERENCES logradouro (id_log)
);

-- ==========================
-- TABELAS DE CLIENTE
-- ==========================

CREATE TABLE cliente (
    id_cliente       NUMBER PRIMARY KEY,
    nome             VARCHAR2(50) NOT NULL,
    data_nascimento  DATE NOT NULL,
    cpf_cnpj         NUMBER NOT NULL,
    id_endereco      NUMBER NOT NULL, -- Relacionando Cliente → Endereço
    id_situacao      NUMBER,         -- Relacionando Cliente → Situação Cliente
    id_tipo          NUMBER NOT NULL, -- Relacionando Cliente → Tipo Cliente
    id_genero        NUMBER NOT NULL, -- Relacionando Cliente → Gênero
    CONSTRAINT fk_cliente_endereco FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco),
    CONSTRAINT fk_cliente_situacao FOREIGN KEY (id_situacao) REFERENCES situacao_cliente (id_situacao),
    CONSTRAINT fk_cliente_tipo FOREIGN KEY (id_tipo) REFERENCES tipo_cliente (id_tipo),
    CONSTRAINT fk_cliente_genero FOREIGN KEY (id_genero) REFERENCES genero (id_genero)
);

CREATE TABLE tipo_cliente (
    id_tipo        NUMBER PRIMARY KEY,
    descricao_tipo VARCHAR2(50) NOT NULL
);

CREATE TABLE genero (
    id_genero        NUMBER PRIMARY KEY,
    descricao_genero VARCHAR2(30) NOT NULL
);

-- ==========================
-- TABELAS DE CONTATO
-- ==========================

CREATE TABLE contato (
    id_contato NUMBER PRIMARY KEY,
    telefone   VARCHAR2(20),
    email      VARCHAR2(100),
    id_cliente NUMBER NOT NULL,
    CONSTRAINT fk_contato_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

-- ==========================
-- OUTRAS RELAÇÕES
-- ==========================

CREATE TABLE situacao_cliente (
    id_situacao  NUMBER PRIMARY KEY,
    descricao    VARCHAR2(30) NOT NULL
);

CREATE TABLE tipo_pagamento (
    id_tipo_pagamento NUMBER PRIMARY KEY,
    descricao         VARCHAR2(50) NOT NULL
);

CREATE TABLE cliente_pagamento (
    id_cliente        NUMBER NOT NULL,
    id_tipo_pagamento NUMBER NOT NULL,
    CONSTRAINT fk_cliente_pagamento FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT fk_tipo_pagamento FOREIGN KEY (id_tipo_pagamento) REFERENCES tipo_pagamento (id_tipo_pagamento),
    PRIMARY KEY (id_cliente, id_tipo_pagamento)
);

CREATE TABLE historico_login (
    id_login       NUMBER PRIMARY KEY,
    id_cliente     NUMBER NOT NULL,
    data_hora_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_acesso      VARCHAR2(45),
    CONSTRAINT fk_login_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);
-- ==========================
-- TABELAS DE LOCALIZAÇÃO
-- ==========================

CREATE TABLE pais (
    id_pais   NUMBER PRIMARY KEY,
    nome_pais VARCHAR2(50) NOT NULL
);

CREATE TABLE estado (
    id_estado   NUMBER PRIMARY KEY,
    nome_estado VARCHAR2(30) NOT NULL,
    id_pais     NUMBER NOT NULL,
    CONSTRAINT fk_estado FOREIGN KEY (id_pais) REFERENCES pais (id_pais)
);

CREATE TABLE cidade (
    id_cidade   NUMBER PRIMARY KEY,
    nome_cidade VARCHAR2(30) NOT NULL,
    id_estado   NUMBER NOT NULL,
    CONSTRAINT fk_cidade FOREIGN KEY (id_estado) REFERENCES estado (id_estado)
);

CREATE TABLE bairro (
    id_bairro   NUMBER PRIMARY KEY,
    nome_bairro VARCHAR2(30) NOT NULL,
    id_cidade   NUMBER NOT NULL,
    CONSTRAINT fk_bairro FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade)
);

-- ==========================
-- TABELAS DE ENDEREÇO
-- ==========================

CREATE TABLE logradouro (
    id_log        NUMBER PRIMARY KEY,
    descricao_log VARCHAR2(50) NOT NULL
);

CREATE TABLE endereco (
    id_endereco   NUMBER PRIMARY KEY,
    logradouro    VARCHAR2(50) NOT NULL,
    numero        NUMBER NOT NULL,
    cep           NUMBER NOT NULL,
    complemento   VARCHAR2(50),
    referencia    VARCHAR2(50),
    id_bairro     NUMBER NOT NULL,
    id_log        NUMBER NOT NULL, -- Relacionando com Tipo_Logradouro
    CONSTRAINT fk_endereco_bairro FOREIGN KEY (id_bairro) REFERENCES bairro (id_bairro),
    CONSTRAINT fk_endereco_log FOREIGN KEY (id_log) REFERENCES logradouro (id_log)
);

-- ==========================
-- TABELAS DE CLIENTE
-- ==========================

CREATE TABLE cliente (
    id_cliente       NUMBER PRIMARY KEY,
    nome             VARCHAR2(50) NOT NULL,
    data_nascimento  DATE NOT NULL,
    cpf_cnpj         NUMBER NOT NULL,
    id_endereco      NUMBER NOT NULL, -- Relacionando Cliente → Endereço
    id_situacao      NUMBER,         -- Relacionando Cliente → Situação Cliente
    id_tipo          NUMBER NOT NULL, -- Relacionando Cliente → Tipo Cliente
    id_genero        NUMBER NOT NULL, -- Relacionando Cliente → Gênero
    id_cargo         NUMBER NOT NULL,
    CONSTRAINT fk_cliente_endereco FOREIGN KEY (id_endereco) REFERENCES endereco (id_endereco),
    CONSTRAINT fk_cliente_situacao FOREIGN KEY (id_situacao) REFERENCES situacao_cliente (id_situacao),
    CONSTRAINT fk_cliente_tipo FOREIGN KEY (id_tipo) REFERENCES tipo_cliente (id_tipo),
    CONSTRAINT fk_cliente_genero FOREIGN KEY (id_genero) REFERENCES genero (id_genero)
);

CREATE TABLE tipo_cliente (
    id_tipo        NUMBER PRIMARY KEY,
    descricao_tipo VARCHAR2(50) NOT NULL
);


CREATE TABLE cliente_fisico (
    id_fisico  NUMBER PRIMARY KEY,
    cpf        NUMBER NOT NULL,
    id_cliente NUMBER NOT NULL,
    id_genero  NUMBER NOT NULL
);
            

CREATE TABLE cliente_juridico (
    id_juri    NUMBER PRIMARY KEY,
    cnpj       NUMBER NOT NULL,
    id_cliente NUMBER NOT NULL,
    ie         NUMBER NOT NULL
);

CREATE TABLE genero (
    id_genero        NUMBER PRIMARY KEY,
    descricao_genero VARCHAR2(30) NOT NULL
);

CREATE TABLE cargo (
    id_cargo NUMBER PRIMARY KEY,
    nome     VARCHAR2(50)
);

CREATE TABLE item_pedido (
    id_pedido      NUMBER PRIMARY KEY,
    quantidade     NUMBER NOT NULL,
    valor_unitario NUMBER NOT NULL,
    id_produto     NUMBER NOT NULL
);

CREATE TABLE produto (
    id_produto NUMBER PRIMARY KEY,
    descricao  VARCHAR2(50) NOT NULL,
    id_tipo    NUMBER NOT NULL
);

CREATE TABLE tipo (
    id_tipo   NUMBER PRIMARY KEY,
    descricao VARCHAR2(50)
);

CREATE TABLE funcionario (
    id_funcionario       NUMBER PRIMARY KEY,
    nome                 VARCHAR2(50) NOT NULL,
    data_cadastro        DATE NOT NULL,
    id_cargo             NUMBER NOT NULL,
    id_funcinario_gestor NUMBER NOT NULL
);

CREATE TABLE pedido (
    id_pedido       NUMBER PRIMARY KEY,
    data            DATE,
    id_cliente      NUMBER NOT NULL,
    id_genero       NUMBER NOT NULL,
    id_funcionario  NUMBER NOT NULL
);


CREATE SEQUENCE SQ_MODELO_PEDIDO;

INSERT INTO PAIS (ID_PAIS, NOME_PAIS) VALUES (SQ_MODELO_PEDIDO.NEXTVAL,'BRASIL');
INSERT INTO PAIS (ID_PAIS, NOME_PAIS) VALUES (SQ_MODELO_PEDIDO.NEXTVAL,'JAPÃO');
INSERT INTO PAIS (ID_PAIS, NOME_PAIS) VALUES (SQ_MODELO_PEDIDO.NEXTVAL,'EUA');
INSERT INTO PAIS (ID_PAIS, NOME_PAIS) VALUES (SQ_MODELO_PEDIDO.NEXTVAL,'CHILE');
INSERT INTO PAIS (ID_PAIS, NOME_PAIS) VALUES (SQ_MODELO_PEDIDO.NEXTVAL,'COREIA');
COMMIT;
DELETE FROM PAIS WHERE ID_PAIS =2;
COMMIT;

SELECT * FROM PAIS;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES (
    sq_modelo_pedido.NEXTVAL,
    'SÃO PAULO',
    1
);
INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES (
    sq_modelo_pedido.NEXTVAL,
    'PARANA',
    1
);

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES (
    sq_modelo_pedido.NEXTVAL,
    'MINAS GERAIS',
    1
);
INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES (
    sq_modelo_pedido.NEXTVAL,
    'MATO GROSSO DO SUL',
    1
);

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES (
    sq_modelo_pedido.NEXTVAL,
    'RIO DE JANEIRO',
    1
);

COMMIT;

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES (
    sq_modelo_pedido.NEXTVAL,
    'SEUL',
    105
);
INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES (
    sq_modelo_pedido.NEXTVAL,
    'Gyeonggi-do',
    105
);

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES (
    sq_modelo_pedido.NEXTVAL,
    'Gangwon-do',
    105
);

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES (
    sq_modelo_pedido.NEXTVAL,
    'Chungcheongnam-do',
    105
);

INSERT INTO estado (
    id_estado,
    nome_estado,
    id_pais
) VALUES (
    sq_modelo_pedido.NEXTVAL,
    'Jeollanam-do',
    105
);

INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'CALIFÓRNIA',163);
INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'TEXAS', 163);
    
 INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'FLÓRIDA',163); 
     INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'NOVA YORK',163); 
    
     INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'ILLNOIS',163); 
    
     INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'SANTIAGO',124); 
    
      INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'VALPARAÍSO',124); 
    
      INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'ANTOFAGASTA',124); 
      INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'MAGALLANES',124); 
      INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'BIOBÍO',124); 
    
      INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'SANTIAGO',124); 
      INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'Tóquio',142); 
       INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'Osaka ',142); 
    
          INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'Hokkaido ',142); 
    
        INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'Fukuoka',142);
    
          INSERT
    INTO estado (
        id_estado,
        nome_estado,
        id_pais
    ) VALUES ( sq_modelo_pedido.nextval, 'Kyoto',142);
    
SELECT * FROM ESTADO;



INSERT INTO cidade (
    id_cidade,
    nome_cidade,
     id_pais,
    id_estado
) VALUES (
    sq_modelo_pedido.nextal,
    'SÃO PAULO',
    1
);


SELECT *FROM CIDADE;

COMMIT;

