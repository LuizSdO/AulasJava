--- INTEGRANTES DO GRUPO ---
-- 1: Gustavo Evangelista Cardoso    RM: 93409
-- 2: Jefferson de Andrade Chaves    RM: 96236
-- 3: Pedro Victor Pereira Coque dos Santos  RM: 94216

-- ____DROP TABLE____
/*DROP TABLE T_SSM_PAIS CASCADE CONSTRAINTS;
DROP TABLE "T_SSM_REL_ALBUM/USER" CASCADE CONSTRAINTS;
DROP TABLE T_SSM_FX_PLAYLIST CASCADE CONSTRAINTS;
DROP TABLE T_SSM_FX_ALBUM CASCADE CONSTRAINTS;
DROP TABLE "T_SSM_REL_ART/MSC" CASCADE CONSTRAINTS;
DROP TABLE T_SSM_USUARIO CASCADE CONSTRAINTS;
DROP TABLE T_SSM_ALBUM CASCADE CONSTRAINTS;
DROP TABLE T_SSM_PLAYLIST CASCADE CONSTRAINTS;
DROP TABLE T_SSM_MUSICA CASCADE CONSTRAINTS;
DROP TABLE T_SSM_GEN_MUSICAL CASCADE CONSTRAINTS;
DROP TABLE T_SSM_ARTISTA CASCADE CONSTRAINTS;*/


-- ____Comandos Create Table____

-- TABELA PAIS
CREATE TABLE t_ssm_pais (
    cd_pais NUMBER(3) NOT NULL,
    nm_pais VARCHAR2(40) NOT NULL,
    sg_pais CHAR(4) NOT NULL
);

-- TABELA USUARIO
CREATE TABLE t_ssm_usuario (
    cd_usuario    NUMBER(9) NOT NULL,
    cd_pais       NUMBER(3) NOT NULL,
    nm_usuario    VARCHAR2(60) NOT NULL,
    ds_email      VARCHAR2(60) NOT NULL,
    cd_senha      VARCHAR2(60) NOT NULL,
    dt_nascimento DATE NOT NULL,
    ds_genero     VARCHAR2(2) NOT NULL,
    nr_tel        NUMBER(9),
    nr_ddd_tel    NUMBER(2)
);

-- TABELA REL ALBUM USER
CREATE TABLE "T_SSM_REL_ALBUM/USER" (
    cd_id_album NUMBER(5) NOT NULL,
    cd_usuario  NUMBER(9) NOT NULL,
    st_favorito NUMBER(1) NOT NULL
);

-- TABELA ALBUM
CREATE TABLE t_ssm_album (
    cd_id_album   NUMBER(5) NOT NULL,
    nm_album      VARCHAR2(80) NOT NULL,
    dt_lancamento DATE NOT NULL
);

-- TABELA PLAYLIST
CREATE TABLE t_ssm_playlist (
    cd_id_playlist NUMBER(5) NOT NULL,
    nm_playlist    VARCHAR2(80) NOT NULL,
    ds_tipo        NUMBER(1) NOT NULL
);

-- TABELA FAIXAS DA PLAYLIST
CREATE TABLE t_ssm_fx_playlist (
    cd_id_playlist NUMBER(5) NOT NULL,
    cd_usuario     NUMBER(9) NOT NULL,
    nr_faixas      NUMBER(9) NOT NULL,
    cd_id_musica   NUMBER(5) NOT NULL,
    tm_musica      DATE NOT NULL
);

-- TABELA MUSICA
CREATE TABLE t_ssm_musica (
    cd_id_musica   NUMBER(5) NOT NULL,
    cd_genero      NUMBER(2) NOT NULL,
    nm_musica      VARCHAR2(55) NOT NULL,
    fm_audio       VARCHAR2(5) NOT NULL,
    ds_path_musica VARCHAR2(200) NOT NULL,
    dt_composicao  DATE
);

-- TABELA FAIXA DE ALBUM
CREATE TABLE t_ssm_fx_album (
    cd_id_album  NUMBER(5) NOT NULL,
    nr_faixa     NUMBER(9) NOT NULL,
    cd_id_musica NUMBER(5) NOT NULL,
    tm_musica    DATE NOT NULL
);

-- TABELA GENERO MUSICAL
CREATE TABLE t_ssm_gen_musical (
    cd_genero NUMBER(2) NOT NULL,
    nm_genero VARCHAR2(55) NOT NULL
);

-- TABELA RELACAO ART/MUSICA
CREATE TABLE "T_SSM_REL_ART/MSC" (
    cd_id_musica  NUMBER(5) NOT NULL,
    cd_id_artista NUMBER(4) NOT NULL,
    st_compositor NUMBER(1) NOT NULL,
    st_interprete NUMBER(1) NOT NULL
);

-- TABELA ARTISTA
CREATE TABLE t_ssm_artista (
    cd_id_artista NUMBER(4) NOT NULL,
    nm_artista    VARCHAR2(30) NOT NULL
);


-- _____COMANDOS ALTER TABLE_____

-- __CHAVES PRIMÁRIS__

-- TABELA PAIS
ALTER TABLE t_ssm_pais 
ADD CONSTRAINT pk_ssm_pais
PRIMARY KEY (cd_pais);

-- TABELA USUARIO
ALTER TABLE t_ssm_usuario 
ADD CONSTRAINT pk_ssm_usuario 
PRIMARY KEY (cd_usuario);

-- TABELA REL ALBUM/USER
ALTER TABLE "T_SSM_REL_ALBUM/USER" 
ADD CONSTRAINT "PK_SSM_REL_ALBUM/USER" 
PRIMARY KEY (cd_usuario, cd_id_album);

-- TABELA ALBUM
ALTER TABLE t_ssm_album 
ADD CONSTRAINT pk_ssm_album 
PRIMARY KEY (cd_id_album);

-- TABELA PLAYLIST
ALTER TABLE t_ssm_playlist 
ADD CONSTRAINT pk_ssm_playlist 
PRIMARY KEY (cd_id_playlist);

-- TAEBLA FAIXAS PLAYLIST
ALTER TABLE t_ssm_fx_playlist
ADD CONSTRAINT pk_ssm_fx_playlist 
PRIMARY KEY (nr_faixas, cd_id_playlist, cd_usuario);

-- TABELA MUSICA
ALTER TABLE t_ssm_musica 
ADD CONSTRAINT pk_ssm_musica 
PRIMARY KEY (cd_id_musica);

-- TABELA FX ALBUM
ALTER TABLE t_ssm_fx_album 
ADD CONSTRAINT pk_ssm_fx_album 
PRIMARY KEY (nr_faixa, cd_id_album);

-- TABELA GENERO MUSICAL
ALTER TABLE t_ssm_gen_musical 
ADD CONSTRAINT pk_ssm_gen_musical 
PRIMARY KEY (cd_genero);

-- TABELA REL ARTISTA/MUSICA
ALTER TABLE "T_SSM_REL_ART/MSC" 
ADD CONSTRAINT "PK_SSM_REL_ART/MSC" 
PRIMARY KEY (cd_id_musica, cd_id_artista);

-- TABELA ARTISTA
ALTER TABLE t_ssm_artista 
ADD CONSTRAINT pk_ssm_artista 
PRIMARY KEY (cd_id_artista);


-- __UNIQUES__

-- TABELA PAIS
ALTER TABLE t_ssm_pais 
ADD CONSTRAINT un_ssm_pais_nm_pais
UNIQUE (nm_pais);

-- TABELA ALBUM
ALTER TABLE t_ssm_album 
ADD CONSTRAINT un_ssm_album_nm_alb 
UNIQUE (nm_album);

-- TABELA PLAYLIST
ALTER TABLE t_ssm_playlist 
ADD CONSTRAINT un_ssm_playlist_nm_play 
UNIQUE (nm_playlist);

-- TABELA GENERO MUSICAL
ALTER TABLE t_ssm_gen_musical 
ADD CONSTRAINT un_ssm_gen_musical_nm_gen 
UNIQUE (nm_genero);


-- __CHECKS__

-- TABELA USUARIO
ALTER TABLE t_ssm_usuario
ADD CONSTRAINT ck_ssm_usuario_ds_gen 
CHECK (upper(ds_genero) = 'M' OR upper(ds_genero) = 'H' OR upper(ds_genero) = 'NB');

-- TABELA ALBUM/USER
ALTER TABLE "T_SSM_REL_ALBUM/USER"
ADD CONSTRAINT "CK_SSM_REL_ALBUM/USER_ST_FAV" 
CHECK (st_favorito = 0 OR st_favorito = 1);

-- TABELA PLAYLIST
ALTER TABLE t_ssm_playlist
ADD CONSTRAINT ck_ssm_playlist_ds_tipo 
CHECK (ds_tipo = 0 OR ds_tipo = 1);

-- TABELA RELAÇÃO ARTISTA MUSICA
-- PRIMEIRA
ALTER TABLE "T_SSM_REL_ART/MSC"
ADD CONSTRAINT "CK_SSM_REL_ART/MSC_ST_COM" 
CHECK (st_compositor = 1 OR st_compositor = 0);
-- SEGUNDA
ALTER TABLE "T_SSM_REL_ART/MSC"
ADD CONSTRAINT "CK_SSM_REL_ART/MSC_ST_INT" 
CHECK (st_interprete = 1 OR st_interprete = 0);


-- __CHAVES ESTRANGENIRAS__

-- TABELA USUARIO
ALTER TABLE t_ssm_usuario
ADD CONSTRAINT fk_ssm_usuario_pais 
FOREIGN KEY (cd_pais)
REFERENCES t_ssm_pais (cd_pais);

-- TABELA REL ALBUM/USER
-- PRIMEIRA
ALTER TABLE "T_SSM_REL_ALBUM/USER"
ADD CONSTRAINT "FK_SSM_REL_ALBUM/USER_ALBUM" 
FOREIGN KEY (cd_id_album)
REFERENCES t_ssm_album (cd_id_album);
-- SEGUNDA
ALTER TABLE "T_SSM_REL_ALBUM/USER"
ADD CONSTRAINT "FK_SSM_REL_ALBUM/USER_USUARIO" 
FOREIGN KEY (cd_usuario)
REFERENCES t_ssm_usuario (cd_usuario);

-- TABELA FAIXAS PLAYLIST
-- PRIMEIRA
ALTER TABLE t_ssm_fx_playlist
ADD CONSTRAINT fk_ssm_fx_playlist_musica 
FOREIGN KEY (cd_id_musica)
REFERENCES t_ssm_musica (cd_id_musica);
-- SEGUNDA
ALTER TABLE t_ssm_fx_playlist
ADD CONSTRAINT fk_ssm_fx_playlist_playlist 
FOREIGN KEY (cd_id_playlist)
REFERENCES t_ssm_playlist (cd_id_playlist);

-- TABELA MUSICA
ALTER TABLE t_ssm_musica
ADD CONSTRAINT fk_ssm_musica_gen_musical 
FOREIGN KEY (cd_genero)
REFERENCES t_ssm_gen_musical (cd_genero);

-- TABELA FAIXA ALBUM
-- PRIMEIRA
ALTER TABLE t_ssm_fx_album
ADD CONSTRAINT fk_ssm_fx_album_album 
FOREIGN KEY (cd_id_album)
REFERENCES t_ssm_album (cd_id_album);
-- SEGUNDA
ALTER TABLE t_ssm_fx_album
ADD CONSTRAINT fk_ssm_fx_album_musica 
FOREIGN KEY (cd_id_musica)
REFERENCES t_ssm_musica (cd_id_musica);

-- TABELA RELAÇÃO ARTISTA MUSICA
-- PRIMEIRA
ALTER TABLE "T_SSM_REL_ART/MSC"
ADD CONSTRAINT "FK_SSM_REL_ART/MSC_ARTISTA" 
FOREIGN KEY (cd_id_artista)
REFERENCES t_ssm_artista (cd_id_artista); 
-- SEGUNDA
ALTER TABLE "T_SSM_REL_ART/MSC"
ADD CONSTRAINT "FK_SSM_REL_ART/MSC_MUSICA" 
FOREIGN KEY (cd_id_musica)
REFERENCES t_ssm_musica (cd_id_musica); 
