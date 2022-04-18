DROP TABLE vacina, local_vacinacao,
		   grupo_prioritario_cidadao, profissional_da_saude,
		   cidadao, bairro, cidade, estado, lote, grupo_prioritario;
		  
CREATE TABLE lote(
	n_lote SERIAL PRIMARY KEY,
	total_doses INTEGER NOT NULL,
	marca VARCHAR(255) NOT NULL,
	data_fabricacao DATE NOT NULL,
	data_validade DATE NOT NULL
);

CREATE TABLE grupo_prioritario(
	categoria VARCHAR(63) PRIMARY KEY,
	descricao TEXT NOT NULL
);

CREATE TABLE estado (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(31) NOT NULL
);


CREATE TABLE cidade (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(127) NOT NULL,
	estado_id INTEGER NOT NULL,
	FOREIGN KEY(estado_id) REFERENCES estado(id)
);

CREATE TABLE bairro (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(127) NOT NULL,
	cidade_id INTEGER NOT NULL,
	FOREIGN KEY(cidade_id) REFERENCES cidade(id)
);

CREATE TABLE cidadao(
	--trigger? sim : nao
	cpf CHAR(11) PRIMARY KEY,
	nome VARCHAR(127) NOT NULL,
	telefone VARCHAR(11) NOT NULL,
	sexo CHAR(1) NOT NULL CHECK(sexo IN ('F', 'M')),
	bairro_id INTEGER NOT NULL,
	rua VARCHAR(127) NOT NULL,
	numero VARCHAR(15) NOT NULL,
	FOREIGN KEY(bairro_id) REFERENCES bairro(id)
);

CREATE TABLE local_vacinacao(
	cnes VARCHAR(7) PRIMARY KEY,
	nome_unidade VARCHAR(127),
	bairro_id INTEGER,
	rua VARCHAR(127) NOT NULL,
	numero VARCHAR(15) NOT NULL,
	FOREIGN KEY(bairro_id) REFERENCES bairro(id)
); 

CREATE TABLE profissional_da_saude(
	cpf CHAR(11) PRIMARY KEY,
	registro_profissional VARCHAR(17) NOT NULL,
	FOREIGN KEY(cpf) REFERENCES cidadao (cpf)
);


CREATE TABLE grupo_prioritario_cidadao(
	categoria VARCHAR(63), 
	cpf CHAR (11),
	PRIMARY KEY (categoria, cpf),
	FOREIGN KEY (categoria) REFERENCES grupo_prioritario (categoria),
	FOREIGN KEY (cpf)       REFERENCES cidadao (cpf)
);

CREATE TABLE vacina(
	id SERIAL,
	n_lote INTEGER,
	cpf_vacinado CHAR(11) NOT NULL,
	cpf_aplicante CHAR(11) NOT NULL,
	cnes VARCHAR(7) NOT NULL,
	data_aplicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (id, n_lote),
	FOREIGN KEY(n_lote)        REFERENCES lote (n_lote),
	FOREIGN KEY(cpf_vacinado)  REFERENCES cidadao (cpf),
	FOREIGN KEY(cpf_aplicante) REFERENCES profissional_da_saude (cpf),
	FOREIGN KEY(cnes)          REFERENCES local_vacinacao (cnes)	
);





