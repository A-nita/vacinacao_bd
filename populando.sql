SELECT * FROM estado;
SELECT * FROM cidade;
SELECT * FROM bairro;

SELECT * 
FROM cidade INNER JOIN estado ON cidade.estado_id = estado.id;

SELECT * 
FROM cidade INNER JOIN bairro ON cidade.id = bairro.cidade_id;

DROP TABLE estado;

--ESTADO
INSERT INTO estado (nome) 
VALUES
('Acre'),('Alagoas'),('Amazonas'),
('Amapá'),('Bahia'),('Ceará'),
('Distrito Federal'),('Espírito Santo'),
('Goiás'),('Maranhão'),('Minas Gerais'),
('Mato Grosso do Sul'),('Mato Grosso'),
('Pará'),('Paraíba'),('Pernambuco'),
('Piauí'),('Paraná'),('Rio de Janeiro'),
('Rio Grande do Norte'),('Rondônia'),('Roraima'),
('Rio Grande do Sul'),('Santa Catarina'),
('Sergipe'),('São Paulo'),('Tocantins');

--CIDADE
INSERT INTO cidade(nome, estado_id) VALUES
('São Paulo', 26), ('Sorocaba', 26), ('Ribeirão Preto', 26),
('Votorantim', 26), ('Bauru', 26), ('Barueri', 26),
('Campinas', 26), ('São Carlos', 26), ('Santos', 26),
('Belo Horizonte', 11), ('Ouro Preto', 11), ('Juiz de Fora', 11),
('Diamantina', 11), ('Uberlândia', 11), ('Uberaba', 11),
('Rio de Janeiro', 19), ('Angra dos Reis', 19), ('Parati', 19),
('Volta Redonda', 19), ('Niterói', 19), ('Petrópolis', 19),
('Manaus', 3);

--BAIRRO
--Sorocaba
INSERT INTO bairro(nome, cidade_id) VALUES
('Jd. São Carlos', 2), ('Campolim', 2), ('Jd. Zulmira', 2),
('Vila Jardini', 2), ('Jd. Vera Cruz', 2), ('Jd. América', 2),
('Jd. dos Estados', 2);

--Ribeirão Preto
INSERT INTO bairro(nome, cidade_id) VALUES
('Jd. Canada', 3), ('Jd. Mirajá', 3), ('Jd. Botânico', 3),
('Jd. Sumaré', 3), ('Jd. João Rossi', 3), ('Vila Virginia', 3),
('Campos Elísios', 3), ('Ipiranga', 3);

--GRUPO PRIORITARIO

INSERT INTO grupo_prioritario (categoria, descricao)
VALUES ('IDOSO', 'Idoso é todo indivíduo com 60 anos ou mais.');

INSERT INTO grupo_prioritario (categoria, descricao)
VALUES ('OBESO', ' Distúrbio que envolve excesso de gordura corporal, aumentando o risco de problemas de saúde.');

INSERT INTO grupo_prioritario (categoria, descricao)
VALUES ('DIABÉTICO', 'Pessoas com doenças que resultam em alto nível de glicose no sangue.');

INSERT INTO grupo_prioritario (categoria, descricao)
VALUES ('PROFISSIONAL DA SAÚDE', 'Pessoa que trabalha em uma profissão relacionada às ciências da saúde.');

INSERT INTO grupo_prioritario (categoria, descricao)
VALUES ('PROFISSIONAL DA EDUCAÇÃO', 'Todos os profissionais que atuam em escolas e instituições de ensino são considerados profissionais da Educação');


--LOCAL VACINACAO








