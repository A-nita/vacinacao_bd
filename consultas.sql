--1 Número de pessoas vacinadas de determinada faixa etária:
SELECT * FROM bairro
SELECT COUNT(DISTINCT cidadao.cpf)
FROM cidadao JOIN vacina 
ON cidadao.cpf = vacina.cpf_vacinado;

-- 2
SELECT DISTINCT cidadao.* FROM cidadao
INNER JOIN vacina ON cidadao.CPF = vacina.CPF_vacinado
WHERE cidadao.bairro_id IN (SELECT id FROM bairro WHERE nome = 'Centro');
