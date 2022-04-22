--1 Número de pessoas vacinadas de determinada faixa etária:

SELECT COUNT(DISTINCT cidadao.cpf)
FROM cidadao JOIN vacina 
ON cidadao.cpf = vacina.cpf_vacinado
WHERE 
EXTRACT(YEAR FROM AGE(cidadao.data_nascimento)) BETWEEN 17 AND 23;

-- 2 Pessoas que foram vacinadas em determinado bairro
SELECT DISTINCT cidadao.* FROM cidadao
INNER JOIN vacina ON cidadao.CPF = vacina.CPF_vacinado
WHERE cidadao.bairro_id IN (SELECT id FROM bairro WHERE nome = 'Centro');

-- 3 Para um lote, consultar a quantidade de vacinas restantes
SELECT lote.total_doses - (
	SELECT COUNT(vacina.id)
	FROM lote LEFT JOIN vacina
	ON lote.n_lote = vacina.n_lote
	WHERE lote.n_lote = 1
) FROM lote WHERE lote.n_lote = 1

-- 4 Número de pessoas vacinadas de um grupo prioritário

SELECT grupo_prioritario.categoria, COUNT(grupo_prioritario_cidadao.categoria)
FROM grupo_prioritario LEFT JOIN grupo_prioritario_cidadao
ON grupo_prioritario.categoria = grupo_prioritario_cidadao.categoria
WHERE grupo_prioritario_cidadao.categoria = 'IDOSO'
GROUP BY 1;

--5 Listar lotes com data vencimento mais próxima
SELECT * FROM lote
WHERE data_validade = (SELECT MIN(data_validade) FROM lote);

--6 Mostrar o nome das categoria dos grupos prioritário de um cidadão
SELECT categoria
FROM grupo_prioritario_cidadao
WHERE cpf = '65777840604';

--7 Quantidade de vacinas já aplicadas de um lote
SELECT lote.n_lote ,COUNT(vacina.id)  FROM lote -- aq n sei se precisa projetar o n_lote
LEFT JOIN vacina ON lote.n_lote = vacina.n_lote
WHERE lote.n_lote = 5 --lote buscado
GROUP BY lote.n_lote 
ORDER BY lote.n_lote;

--8 Listar os pacientes que tomaram a vacina de determinado lote
SELECT c.nome, c.cpf FROM vacina v
join cidadao c on v.cpf_vacinado = c.cpf
where v.n_lote = 1;

--9 Verificar se dado cidadão já foi vacinado
SELECT DISTINCT cidadao.* FROM
cidadao JOIN vacina
ON cidadao.cpf = vacina.cpf_vacinado
WHERE cidadao.cpf = '18556602371';


-- 10 Listar os lotes que não possuem mais vacinas
SELECT * FROM (
    SELECT *, total_doses - (
        SELECT COUNT(lote.n_lote) FROM lote
        INNER JOIN vacina ON vacina.n_lote = lote.n_lote
        WHERE lote.n_lote = l.n_lote
    ) AS qtd_doses_restantes
    FROM lote l
) AS subquery
WHERE qtd_doses_restantes = 0;

--11 Consultar tempo de validade do lote
SELECT (data_validade - CURRENT_DATE) AS tempo_de_validade_em_dias
FROM lote
WHERE n_lote = 2;

--12 Verificar todas as aplicações de vacinas que ocorreram em um determinado local de vacinação
SELECT * FROM vacina 
WHERE cnes = '2055139';

--13 Mostrar quantas doses um certo cidadão recebeu
SELECT COUNT(*) FROM cidadao c 
LEFT JOIN vacina v 
on c.cpf = v.cpf_vacinado
WHERE c.cpf = '55609888042'
GROUP BY c.cpf;


--14 -Número de vacina que cada cidadão tomou:
SELECT cidadao.nome, COUNT(vacina.cpf_vacinado)
FROM cidadao LEFT JOIN vacina 
ON cidadao.cpf = vacina.cpf_vacinado
GROUP BY 1
ORDER BY COUNT(vacina.cpf_vacinado) DESC;