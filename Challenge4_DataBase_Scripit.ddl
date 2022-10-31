DROP TABLE t_jj_formacao_academica CASCADE CONSTRAINTS;

DROP TABLE t_jj_candidato CASCADE CONSTRAINTS;

DROP TABLE t_jj_cargo CASCADE CONSTRAINTS;

DROP TABLE t_jj_comp_candidato CASCADE CONSTRAINTS;

DROP TABLE t_jj_comp_vaga CASCADE CONSTRAINTS;

DROP TABLE t_jj_competencia CASCADE CONSTRAINTS;

DROP TABLE t_jj_empresa CASCADE CONSTRAINTS;

DROP TABLE t_jj_requisito CASCADE CONSTRAINTS;

DROP TABLE t_jj_requisito_candidato CASCADE CONSTRAINTS;

DROP TABLE t_jj_requisito_vaga CASCADE CONSTRAINTS;

DROP TABLE t_jj_vaga CASCADE CONSTRAINTS;


CREATE TABLE t_jj_formacao_academica (
    cd_formacao_academica NUMBER(5) NOT NULL,
    cd_candidato          NUMBER(5) NOT NULL,
    nm_curso              VARCHAR2(40) NOT NULL,
    dt_inicio             DATE NOT NULL,
    dt_conclusao          DATE NOT NULL,
    nm_instituicao_ensino VARCHAR2(45) NOT NULL
);


CREATE TABLE t_jj_candidato (
    cd_candidato  NUMBER(5) NOT NULL,
    nm_candidato  VARCHAR2(50) NOT NULL,
    ds_email      VARCHAR2(60) NOT NULL,
    ds_senha      VARCHAR2(35) NOT NULL,
    dt_nascimento DATE NOT NULL,
    nr_cpf        NUMBER(9) NOT NULL,
    nr_telefone   NUMBER(11) NOT NULL,
    nr_rg         NUMBER(8) NOT NULL,
    ds_endereco   VARCHAR2(35) NOT NULL,
    ds_genero     CHAR(3) NOT NULL,
    nr_digito_rg  NUMBER(1) NOT NULL,
    nr_digito_cpf CHAR(2) NOT NULL
);

CREATE TABLE t_jj_cargo (
    cd_cargo   NUMBER(5) NOT NULL,
    cd_vaga    NUMBER(5) NOT NULL,
    nm_cargo   VARCHAR2(70) NOT NULL,
    ds_cargo   VARCHAR2(70) NOT NULL,
    vl_salario NUMBER(6)
);

--ENTIDADE ASSOCIATIVA
CREATE TABLE t_jj_comp_candidato (
    cd_comp_candidato NUMBER(5) NOT NULL,
    cd_candidato      NUMBER(5) NOT NULL,
    ds_comp_candidato VARCHAR2(50)
);

--ENTIADDE ASSOCIATIVA
CREATE TABLE t_jj_comp_vaga (
    cd_comp_vaga NUMBER(5) NOT NULL,
    cd_vaga      NUMBER(5) NOT NULL,
    ds_comp_vaga VARCHAR2(50)
);



CREATE TABLE t_jj_competencia (
    cd_competencia    NUMBER(5) NOT NULL,
    cd_comp_vaga      NUMBER(5) NOT NULL,
    cd_comp_candidato NUMBER(5) NOT NULL
);


CREATE TABLE t_jj_empresa (
    cd_empresa       NUMBER(5) NOT NULL,
    nm_empresa       VARCHAR2(40) NOT NULL,
    qt_funcionario   NUMBER(7) NOT NULL,
    nr_cnpj          NUMBER(13) NOT NULL,
    nr_telefone      NUMBER(11) NOT NULL,
    ds_endereco      VARCHAR2(30) NOT NULL,
    nr_digito_cnpj   NUMBER(2) NOT NULL,
    ds_empresa       VARCHAR2(100) NOT NULL,
    ds_email_empresa VARCHAR2(60) NOT NULL
);


CREATE TABLE t_jj_requisito (
    cd_requisitos     NUMBER(5) NOT NULL,
    cd_rqst_vaga      NUMBER(5) NOT NULL,
    cd_rqst_candidato NUMBER(5) NOT NULL
);



CREATE TABLE t_jj_requisito_candidato (
    cd_rqst_candidato NUMBER(5) NOT NULL,
    cd_candidato      NUMBER(5) NOT NULL,
    ds_requisito      VARCHAR2(150)
);



CREATE TABLE t_jj_requisito_vaga (
    cd_rqst_vaga NUMBER(5) NOT NULL,
    cd_vaga      NUMBER(5) NOT NULL,
    ds_requisito VARCHAR2(100)
);


CREATE TABLE t_jj_vaga (
    cd_vaga            NUMBER(5) NOT NULL,
    cd_empresa         NUMBER(5) NOT NULL,
    cd_candidato       NUMBER(5) NOT NULL,
    st_vaga           CHAR(8) NOT NULL,
    dt_abertura_vaga   DATE NOT NULL,
    dt_fechamento_vaga DATE NOT NULL
);



------PRIMARY KEY------------
--TABELA  T_JJ_FROMACAO_ACADEMICA
ALTER TABLE t_jj_formacao_academica ADD CONSTRAINT pk_jj_formacao_academica PRIMARY KEY ( cd_formacao_academica );

--TABELA T_JJ_CANDIDATO
ALTER TABLE t_jj_candidato ADD CONSTRAINT pk_jj_candidato PRIMARY KEY ( cd_candidato );

--TABELA T_JJ_CARGO
ALTER TABLE t_jj_cargo ADD CONSTRAINT pk_jj_cargo PRIMARY KEY ( cd_cargo );

--TABELA T_JJ_COMP_CANDIDATO
ALTER TABLE t_jj_comp_candidato ADD CONSTRAINT pk_jj_comp_candidato PRIMARY KEY ( cd_comp_candidato );

--TABELA T_JJ_COMP_VAGA
ALTER TABLE t_jj_comp_vaga ADD CONSTRAINT pk_jj_comp_vaga PRIMARY KEY ( cd_comp_vaga );

--TABELA T_JJ_COMPETENCIA
ALTER TABLE t_jj_competencia ADD CONSTRAINT pk_jj_competencia PRIMARY KEY ( cd_competencia );

--TABELA T_JJ_EMPRESA
ALTER TABLE t_jj_empresa ADD CONSTRAINT pk_jj_empresa PRIMARY KEY ( cd_empresa );

--TABELA T_JJ_REQUISITO
ALTER TABLE t_jj_requisito ADD CONSTRAINT pk_jj_requisito PRIMARY KEY ( cd_requisitos );

--TABELA T_JJ_REQUISITO_CANDIDATO
ALTER TABLE t_jj_requisito_candidato ADD CONSTRAINT pk_jj_rqst_cand PRIMARY KEY ( cd_rqst_candidato );

--TABELA T_JJ_REQUISITO_VAGA
ALTER TABLE t_jj_requisito_vaga ADD CONSTRAINT pk_jj_rqst_vaga PRIMARY KEY ( cd_rqst_vaga );

--TABELA T_JJ_VAGA
ALTER TABLE t_jj_vaga ADD CONSTRAINT pk_jj_vaga PRIMARY KEY ( cd_vaga );



-----------UNIQUES------------------

--TABELA T_JJ_CARGO
ALTER TABLE t_jj_cargo ADD CONSTRAINT un_jj_cargo UNIQUE ( cd_vaga );


--TABELA T_JJ_COMPETENCIA
CREATE UNIQUE INDEX t_jj_competencia__idx ON
    t_jj_competencia (
        cd_comp_vaga
    ASC );

CREATE UNIQUE INDEX t_jj_competencia__idxv1 ON
    t_jj_competencia (
        cd_comp_candidato
    ASC );

--TABELA T_JJ_REQUISITO
CREATE UNIQUE INDEX t_jj_requisito__idx ON
    t_jj_requisito (
        cd_rqst_candidato
    ASC );

CREATE UNIQUE INDEX t_jj_requisito__idxv1 ON
    t_jj_requisito (
        cd_rqst_vaga
    ASC );


-----------CHECKS-------------------
--TABELA T_JJ_CANDIDATO
ALTER TABLE t_jj_candidato
ADD CONSTRAINT ck_jj_candidato_ds_genero
CHECK (upper(ds_genero) = 'M' OR upper(ds_genero) = 'H' OR upper(ds_genero) = 'NB');

--TABELA T_JJ_VAGA
ALTER TABLE t_jj_vaga
ADD CONSTRAINT ck_jj_vaga_st_vaga 
CHECK (upper(st_vaga) = 'ABERTA' OR upper(st_vaga) = 'FECHADA');

--TABELA T_JJ_CARGO
ALTER TABLE t_jj_cargo
ADD CONSTRAINT ck_jj_cargo_vl_salario
CHECK (vl_salario >= 1000 AND vl_salario <= 100000);

ALTER TABLE T_JJ_EMPRESA
    ADD CONSTRAINT ck_jj_empresa_func
CHECK (qt_funcionario >= 100) 
    

-----------FOREIGN KEY--------------
ALTER TABLE t_jj_cargo
    ADD CONSTRAINT fk_jj_cargo_vaga FOREIGN KEY ( cd_vaga )
        REFERENCES t_jj_vaga ( cd_vaga );

ALTER TABLE t_jj_comp_candidato
    ADD CONSTRAINT fk_jj_comp_candidato_candidato FOREIGN KEY ( cd_candidato )
        REFERENCES t_jj_candidato ( cd_candidato );

ALTER TABLE t_jj_comp_vaga
    ADD CONSTRAINT fk_jj_comp_vaga_vaga FOREIGN KEY ( cd_vaga )
        REFERENCES t_jj_vaga ( cd_vaga );

ALTER TABLE t_jj_competencia
    ADD CONSTRAINT fk_jj_compe_comp_cand FOREIGN KEY ( cd_comp_candidato )
        REFERENCES t_jj_comp_candidato ( cd_comp_candidato );

ALTER TABLE t_jj_competencia
    ADD CONSTRAINT fk_jj_compe_comp_vaga FOREIGN KEY ( cd_comp_vaga )
        REFERENCES t_jj_comp_vaga ( cd_comp_vaga );

ALTER TABLE t_jj_formacao_academica
    ADD CONSTRAINT fk_jj_formacao_academica_cand FOREIGN KEY ( cd_candidato )
        REFERENCES t_jj_candidato ( cd_candidato );

ALTER TABLE t_jj_requisito_vaga
    ADD CONSTRAINT fk_jj_requisito_vaga_vaga FOREIGN KEY ( cd_vaga )
        REFERENCES t_jj_vaga ( cd_vaga );

ALTER TABLE t_jj_requisito
    ADD CONSTRAINT fk_jj_rqst_rqsto_candidato FOREIGN KEY ( cd_rqst_candidato )
        REFERENCES t_jj_requisito_candidato ( cd_rqst_candidato );

ALTER TABLE t_jj_requisito
    ADD CONSTRAINT fk_jj_rqst_rqsto_vaga FOREIGN KEY ( cd_rqst_vaga )
        REFERENCES t_jj_requisito_vaga ( cd_rqst_vaga );

ALTER TABLE t_jj_requisito_candidato
    ADD CONSTRAINT fk_jj_rqsto_cand_cand FOREIGN KEY ( cd_candidato )
        REFERENCES t_jj_candidato ( cd_candidato );

ALTER TABLE t_jj_vaga
    ADD CONSTRAINT fk_jj_vaga_candidato FOREIGN KEY ( cd_candidato )
        REFERENCES t_jj_candidato ( cd_candidato );

ALTER TABLE t_jj_vaga
    ADD CONSTRAINT fk_jj_vaga_empresa FOREIGN KEY ( cd_empresa )
        REFERENCES t_jj_empresa ( cd_empresa );












