# ProjetoLoja
Projeto Sexta feita 
Banco de Dados 

CREATE DATABASE toyshell;

USE toyshell;

create table produtos (
	cod_produto 		int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descricao			VARCHAR(250) NULL DEFAULT NULL,
    categoria			VARCHAR(50) NULL DEFAULT NULL,
    marca				VARCHAR(50) NOT NULL,
    preco				DECIMAL(10,2) NOT NULL,
    detalhes			TEXT NOT NULL,
    imagem				VARCHAR(255) NULL DEFAULT NULL,
	nome				varchar(250) NOT NULL
)engine=InnoDB;
