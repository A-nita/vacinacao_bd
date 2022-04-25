-- Exemplo da consulta 1 da apresentação

SELECT COUNT(DISTINCT cidadao.cpf)
FROM cidadao JOIN vacina
                  ON cidadao.cpf = vacina.cpf_vacinado
WHERE
    EXTRACT(YEAR FROM AGE(cidadao.data_nascimento))
        BETWEEN 18 AND 30;

SELECT DISTINCT cidadao.nome, EXTRACT(YEAR FROM AGE(cidadao.data_nascimento)) AS idade
FROM cidadao JOIN vacina
                  ON cidadao.cpf = vacina.cpf_vacinado;

-- Exemplo da consulta 2 da apresentação

SELECT lote.total_doses - (
    SELECT COUNT(vacina.id)
    FROM lote LEFT JOIN vacina
                        ON lote.n_lote = vacina.n_lote
    WHERE lote.n_lote = 1
) FROM lote WHERE lote.n_lote = 1;

SELECT total_doses FROM lote WHERE n_lote = 1;

SELECT COUNT(id) FROM vacina WHERE n_lote = 5;

-- Exemplo da consulta 3 da apresentação

SELECT DISTINCT nome FROM cidadao
                              INNER JOIN grupo_prioritario_cidadao
                                         ON grupo_prioritario_cidadao.cpf = cidadao.cpf
                              INNER JOIN vacina ON cidadao.cpf = vacina.cpf_vacinado
WHERE grupo_prioritario_cidadao.categoria = 'IDOSO';


SELECT COUNT(DISTINCT cidadao.cpf)
FROM grupo_prioritario_cidadao
         INNER JOIN cidadao ON cidadao.cpf = grupo_prioritario_cidadao.cpf
         INNER JOIN vacina ON cidadao.cpf = vacina.cpf_vacinado
WHERE grupo_prioritario_cidadao.categoria = 'IDOSO';

-- Exemplo da consulta 4 da apresentação

SELECT COUNT(id)
FROM vacina
WHERE n_lote = 3;

SELECT * FROM vacina WHERE n_lote = 3;

-- Exemplo da consulta 5 da apresentação

SELECT * FROM (
                  SELECT *, total_doses - (
                      SELECT COUNT(lote.n_lote) FROM lote
                                                         INNER JOIN vacina ON vacina.n_lote = lote.n_lote
                      WHERE lote.n_lote = l.n_lote
                  ) AS qtd_doses_restantes
                  FROM lote l
              ) AS subquery
WHERE qtd_doses_restantes = 0;

SELECT *, total_doses - (
    SELECT COUNT(lote.n_lote) FROM lote
                                       INNER JOIN vacina ON vacina.n_lote = lote.n_lote
    WHERE lote.n_lote = l.n_lote
) AS qtd_doses_restantes
FROM lote l

-- Exemplo da consulta 6 da apresentação

SELECT cidadao.nome, COUNT(vacina.cpf_vacinado)
FROM cidadao LEFT JOIN vacina
                       ON cidadao.cpf = vacina.cpf_vacinado
GROUP BY 1
ORDER BY COUNT(vacina.cpf_vacinado) DESC;