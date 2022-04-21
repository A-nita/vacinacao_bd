--1 Número de pessoas vacinadas de determinada faixa etária:
SELECT * FROM bairro
SELECT COUNT(DISTINCT cidadao.cpf)
FROM cidadao JOIN vacina 
ON cidadao.cpf = vacina.cpf_vacinado;

-- 2
SELECT DISTINCT cidadao.* FROM cidadao
INNER JOIN vacina ON cidadao.CPF = vacina.CPF_vacinado
WHERE cidadao.bairro_id IN (SELECT id FROM bairro WHERE nome = 'Centro');

-- 3 Para um lote, consultar a quantidade de vacinas restantes(Bruno Correia Rocha)
SELECT lote.total_doses - (
	SELECT COUNT(vacina.id)
	FROM lote LEFT JOIN vacina
	ON lote.n_lote = vacina.n_lote
	WHERE lote.n_lote = 1
) FROM lote WHERE lote.n_lote = 1



SELECT * FROM lote

-- 4 Número de pessoas vacinadas de um grupo prioritário
--SELECT grupo_prioritario.categoria, COUNT(grupo_prioritario_cidadao.categoria)
--FROM grupo_prioritario LEFT JOIN grupo_prioritario_cidadao
--ON grupo_prioritario.categoria = grupo_prioritario_cidadao.categoria
--GROUP BY 1
--ORDER BY COUNT(grupo_prioritario_cidadao.categoria);

SELECT grupo_prioritario.categoria, COUNT(grupo_prioritario_cidadao.categoria)
FROM grupo_prioritario LEFT JOIN grupo_prioritario_cidadao
ON grupo_prioritario.categoria = grupo_prioritario_cidadao.categoria
WHERE grupo_prioritario_cidadao.categoria = 'IDOSO'
GROUP BY 1;

--5
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

--9

--10

--11


--33 Número de vacina que cada cidadão tomou:
SELECT cidadao.nome, COUNT(vacina.cpf_vacinado)
FROM cidadao LEFT JOIN vacina 
ON cidadao.cpf = vacina.cpf_vacinado
GROUP BY 1
ORDER BY cidadao.nome;
 

