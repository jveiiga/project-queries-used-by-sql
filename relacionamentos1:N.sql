SELECT
	*
FROM 
	desenvolvedores;

--
		
CREATE TABLE IF NOT EXISTS projetos(
	id BIGSERIAL PRIMARY KEY, 
	nome VARCHAR(50) NOT NULL,
	descricao VARCHAR(360) NOT NULL,
	tempo_estimado FLOAT NOT NULL,
	data_inicio DATE NOT NULL, 
	data_final DATE,
	repositorio VARCHAR(120) NOT NULL, 
	id_desenvolvedor INTEGER NOT NULL,
	FOREIGN KEY (id_desenvolvedor) REFERENCES desenvolvedores(id) ON DELETE CASCADE 
);

--

INSERT INTO 
	projetos(nome, descricao, tempo_estimado, data_inicio, data_final, repositorio, id_desenvolvedor)
VALUES 
	('Projeto 1', 'Descricao', 1.6, '2020-01-01', NULL, 'github.com/projeto1', 1),
	('Projeto 2', 'Descricao', 1.2, '2020-01-01', NULL, 'github.com/projeto1', 1),
	('Projeto 3', 'Descricao', 0.6, '2020-01-01', '2020-08-01', 'github.com/projeto1', 1),
	('Projeto 1', 'Descricao', 1.6, '2020-01-01', NULL, 'github.com/projeto1', 3),
	('Projeto 2', 'Descricao', 1.6, '2020-01-01', NULL, 'github.com/projeto1', 3),
	('Projeto 1', 'Descricao', 2.6, '2020-01-01', NULL, 'github.com/projeto1', (SELECT id FROM desenvolvedores WHERE emais = 'jeferson@kenzie.com')),
	('Projeto 2', 'Descricao', 2.6, '2020-01-01', NULL, 'github.com/projeto1', (SELECT id FROM desenvolvedores WHERE emais = 'jeferson@kenzie.com')),
	('Projeto 3', 'Descricao', 2.6, '2020-01-01', NULL, 'github.com/projeto1', (SELECT id FROM desenvolvedores WHERE emais = 'jeferson@kenzie.com'))
RETURNING *;

-- SELECT de duas tabelas retornando só desenvolvedor com projetos

SELECT
	*
FROM 
	desenvolvedores AS de
JOIN 
	projetos AS pr ON de.id = pr.id_desenvolvedor;
	
-- SELECT LEFT JOIN de duas tabelas retornando desenvolvedor com ou sem projetos 

SELECT 
	de.id AS id_desenvolvedor,
	de.nome AS nome_dev,
	pr.id AS id_projeto,
	pr.nome AS nome_projeto,
	pr.repositorio 
FROM 
	desenvolvedores AS de
LEFT JOIN 
	projetos AS pr ON de.id = pr.id_desenvolvedor
ORDER BY pr.id; 

-- SELECT RIGHT JOIN de duas tabelas retornando desenvolvedor com seu endereço

SELECT 
	de.id AS id_desenvolvedor,
	de.nome AS nome_dev,
	de.emais AS email_dev,
	en.cidade, 
	en.estado,
	en.cep,
	en.numero 
FROM 
	enderecos AS en
RIGHT JOIN 
	desenvolvedores AS de ON en.id = de.id_endereco
ORDER BY de.id;  

-- SELECT FULL JOIN de duas tabelas retornando dados de endereços 
-- de desenvolvedores e também endereços sem desenvolvedores

SELECT 
	*
FROM 
	enderecos AS en
FULL JOIN 
	desenvolvedores AS de ON en.id = de.id_endereco
ORDER BY de.id;  

-- SELECT JOIN e LEFT JOIN de três tabelas retornando desenvolvedores, dados de endereços 
-- de desenvolvedores e também projetos sem desenvolvedores

SELECT 
	*
FROM 
	desenvolvedores AS de
JOIN
	enderecos AS en ON de.id_endereco = en.id
LEFT JOIN 
	projetos AS pr ON de.id = pr.id_desenvolvedor;

-- SELECT JOIN de duas tabelas retornando a média de tempo_estimado pelo AVG

SELECT 
	AVG(pr.tempo_estimado) AS media_desenvolvimento -- Valor que não precisa ser convertido
	ROUND(AVG(pr.tempo_estimado)::NUMERIC, 2) AS media_desenvolvimento -- Convertendo valor
FROM 
	desenvolvedores AS de
JOIN 
	projetos AS pr ON pr.id_desenvolvedor = de.id;  