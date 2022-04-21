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
('Jd. dos Estados', 2), ('Cerrado', 2), ('Aparecidinha', 2),
('Brigadeiro Tobias', 2), ('Centro', 2);
INSERT INTO bairro(nome, cidade_id) VALUES ('Centro', 2);

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

SELECT * FROM bairro ;
--LOCAL VACINACAO
--Sorocaba
SELECT * FROM local_vacinacao;
DELETE FROM local_vacinacao;--WHERE cnes = '';
INSERT INTO local_vacinacao VALUES 
('2055139', 'UBS Cerrado', 2, 'RUA VISCONDE DO RIO BRANCO', 4), 
('2059533', 'UNIDADE DE SAUDE DA FAMILIA APARECIDINHA SOROCABA', 17, 'RUA JOAQUIM MACHADO', 620),
('2064316', 'CENTRO DE SAUDE MARCIA MENDES SOROCABA', 5, 'JOSE AUGUSTO RABELLO JUNIOR', 91),
('2070693', 'UNIDADE SAUDE DA FAMILIA E PA BRIGADEIRO TOBIAS SOROCABA', 18, 'RUA ANA GOMES CORREA', 55),
('6402968', 'SERVICO DE ATENCAO DOMICILIAR SAD', 19, 'AV MOREIRA CESAR', 398);
--INSERT INTO local_vacinacao VALUES ('6402968', 'SERVICO DE ATENCAO DOMICILIAR SAD', 19, 'AV MOREIRA CESAR', 398);

-- Local de vacinação - Ribeirão preto
INSERT INTO local_vacinacao(CNES, nome_unidade, bairro_id, rua, numero) VALUES 
('3307905', 'UBS PROF DR JACOB RENATO WOISKI', 12, 'Av. Independência', '4315'),
('2086964', 'UBS DR EDGARD ACHE CSE IPIRANGA', 15, 'Av. Dom Pedro I', '753'),
('2043203', 'UBS DR JOAO PAULO BIN IPIRANGA', 15, 'Av. Dom Pedro I', '1359'),
('2044285', 'UBS NELSON BARRIONOVO', 14, 'Av. Saudade', '1452'),
('2717107', 'CENTRO DE REFERENCIA DR JOSE ROBERTO CAMPI', 13, 'R. Abílio Sampaio', '637');

--LOTE
SELECT * FROM lote;
INSERT INTO lote (total_doses, marca, data_fabricacao, data_validade)
VALUES
( 10000, 'Coronavac', '2022-01-01', '2023-01-01'),
( 10000, 'Coronavac', '2022-04-25', '2023-04-25'),
( 10000, 'Coronavac', '2022-05-10', '2023-05-10'),
( 5000, 'Janssen', '2022-11-05', '2024-11-05'),
( 5000, 'Janssen', '2021-12-13', '2023-12-13'),
( 14000, 'AstraZeneca', '2022-01-01', '2023-01-01'),
( 14000, 'AstraZeneca', '2021-11-21', '2023-11-21'),
( 14000, 'AstraZeneca', '2022-01-15', '2023-01-15'),
( 14000, 'AstraZeneca', '2022-02-01', '2023-02-01'),
( 10000, 'AstraZeneca', '2022-07-06', '2023-07-06'),
( 50000, 'Pfizer', '2022-03-25', '2024-03-25'),
( 50000, 'Pfizer', '2022-01-15', '2024-01-15'),
( 50000, 'Pfizer', '2022-02-17', '2024-01-17'),
( 50000, 'Pfizer', '2022-04-11', '2024-04-11'),
( 50000, 'Pfizer', '2022-04-27', '2024-04-27')
;

--CIDADO
SELECT * FROM cidadao;
INSERT INTO cidadao (cpf,nome, data_nascimento, telefone,sexo,bairro_id,rua,numero)
VALUES
('11012495019', 'Juliette Freire Feitosa', '1989-12-03', '2231768190', 'F', 12, 'Rua Sabará', 173),
('55609888042', 'Felipe Neto', '1988-06-21', '7928161442','M', 5, 'Rua Turim', 243),
('05357086028', 'Zeca Pagodinho', '1959-02-04', '1226243301','M', 18, 'Rua Barão de Itaipava', 277),
('26782143038', 'Fabio Junior', '1953-11-21', '1736813411', 'M', 7, 'Rua Parma', 124),
('63607170002', 'Manuela Ávila', '1981-08-18', '1723505625', 'F', 15, 'Avenida Bertioga', 1455),
 
('87265772598', 'Chou Jisu', '2000-06-21','1224294716', 'F', 2, 'Rua Professor Magalhães de Noronha', 23),
('75837777474', 'Lee Chaeryong', '2001-06-05','1426908223','F', 1, 'Rua João Wagner Way', 123),
('39771129295', 'Hwang Yeji', '2000-05-26','1223791301', 'F', 6, 'Av. Caribe', 421),
('65352234851', 'Shin Ryujin', '2001-04-17','1227188988', 'F', 2, 'Av. Giseli Contantino', 2),
('25146340919', 'Shin Yuna', '2003-12-09','1525054834', 'F', 4, 'Avenida Tuaici', 2754),
 
('18556602371', 'Gregório Fornetti Azevedo', '2001-06-09', '16999120345', 'M', 8, 'R. Primo Zambianchi', '85'),
('65777840604', 'Roberto Carlos', '1974-03-13', '16991234567', 'M', 10, 'R. Waldomiro Corrêa da Silva', '6'),
('62833741154', 'Carlos Roberto', '1995-12-10', '11124573456', 'M', 12, 'Av. Ligia Latufe Salomão', '605'),
('47678303114', 'Chris Martin', '1977-02-02', '1610534543', 'M', 13, 'R. Julio de Mesquita', '282'),
('97222055606', 'Alan Turing', '1950-03-03', '1123563454', 'M', 15, 'R. Avanhandava', '1113')
;





