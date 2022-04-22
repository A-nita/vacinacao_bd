-- DROP TABLE vacina, local_vacinacao,
-- 		   grupo_prioritario_cidadao, profissional_da_saude,
-- 		   cidadao, bairro, cidade, estado, lote, grupo_prioritario;
		  
CREATE TABLE lote(
	n_lote SERIAL PRIMARY KEY,
	total_doses INTEGER NOT NULL CHECK(total_doses >= 1),
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
    data_nascimento DATE NOT NULL CHECK (EXTRACT (YEAR FROM AGE(DATE(data_nascimento))) > 5),
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
    cpf_aplicante CHAR(11) CHECK (cpf_vacinado <> cpf_aplicante) NOT NULL,
    cnes VARCHAR(7) NOT NULL,
    data_aplicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (id, n_lote),
    FOREIGN KEY(n_lote)        REFERENCES lote (n_lote),
    FOREIGN KEY(cpf_vacinado)  REFERENCES cidadao (cpf),
    FOREIGN KEY(cpf_aplicante) REFERENCES profissional_da_saude (cpf),
    FOREIGN KEY(cnes)          REFERENCES local_vacinacao (cnes)
);

 --TRIGGER para adcionar maiores de 60 anos no grupo prioritário de idoso
CREATE OR REPLACE FUNCTION adiciona_idoso() RETURNS trigger AS $$
    DECLARE
        idade_pessoa integer;
	BEGIN
		SELECT EXTRACT(YEAR FROM AGE(NEW.data_nascimento)) INTO idade_pessoa;

		IF TG_OP = 'UPDATE' THEN
			DELETE FROM grupo_prioritario_cidadao WHERE cpf = OLD.CPF AND categoria = 'IDOSO';
		END IF;

		IF idade_pessoa >= 60 THEN
			INSERT INTO grupo_prioritario_cidadao(categoria, cpf)
			VALUES ('IDOSO', NEW.CPF);
		END IF;

		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER adicionar_idoso AFTER UPDATE OR INSERT
    ON cidadao FOR EACH ROW EXECUTE PROCEDURE adiciona_idoso();


--TRIGGER para impedir que sejam cadastradas vacinas de lotes vazios

CREATE OR REPLACE FUNCTION limita_lotes_vazios() RETURNS trigger AS $$
    DECLARE
        qtd_vacinas_restantes integer;
	BEGIN
		SELECT lote.total_doses - (
			SELECT COUNT(vacina.id)
			FROM lote LEFT JOIN vacina
			ON lote.n_lote = vacina.n_lote
			WHERE lote.n_lote = NEW.n_lote) 
		FROM lote WHERE lote.n_lote = NEW.n_lote 
		INTO qtd_vacinas_restantes;

		IF qtd_vacinas_restantes = 0 THEN
			RAISE EXCEPTION 'Lote vazio, impossível cadastrar nova vacina!';
		END IF;

		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER limitar_lotes_vazios BEFORE UPDATE OR INSERT
    ON vacina FOR EACH ROW EXECUTE PROCEDURE limita_lotes_vazios();

DROP TRIGGER limitar_lotes_vazios ON vacina 


