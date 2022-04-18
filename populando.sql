SELECT * FROM estado;
SELECT * FROM cidade;

SELECT cidade.nome, estado.nome 
FROM cidade INNER JOIN estado ON cidade.estado_id = estado.id;

DROP TABLE estado;
INSERT INTO estado (nome) 
VALUES ('São Paulo'),('Minas Gerais');

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


INSERT INTO cidade(nome, estado_id) VALUES
('São Paulo', 26), ('Sorocaba', 26), ('Ribeirão Preto', 26),
('Votorantim', 26), ('Bauru', 26), ('Barueri', 26),
('Campinas', 26), ('São Carlos', 26), ('Santos', 26),
('Belo Horizonte', 11), ('Ouro Preto', 11), ('Juiz de Fora', 11),
('Diamantina', 11), ('Uberlândia', 11), ('Uberaba', 11),
('Rio de Janeiro', 19), ('Angra dos Reis', 19), ('Parati', 19),
('Volta Redonda', 19), ('Niterói', 19), ('Petrópolis', 19),
('Manaus', 3);











