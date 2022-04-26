
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


