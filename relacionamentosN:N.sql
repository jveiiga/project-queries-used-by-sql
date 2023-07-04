CREATE TABLE IF NOT EXISTS tecnologias(
	id BIGSERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL 
);

CREATE TABLE IF NOT EXISTS tecnologias_projetos(
	id BIGSERIAL PRIMARY KEY,
	id_projeto INTEGER NOT NULL,
	FOREIGN KEY (id_projeto) REFERENCES projetos(id) ON DELETE CASCADE,
	id_tecnologia INTEGER NOT NULL,
	FOREIGN KEY (id_tecnologia) REFERENCES tecnologias(id) ON DELETE CASCADE,
	adicionado_em DATE
);

--

INSERT INTO 
	tecnologias(nome)
VALUES
	('JavaScript'),
	('Python'),
	('Express.js'),
	('Django'),
	('HTML'),
	('CSS'),
	('React'),
	('PostgreSQL')
RETURNING *;

--

SELECT 
	*
FROM 
	projetos;

--

INSERT INTO 
	tecnologias_projetos(id_projeto, id_tecnologia, adicionado_em)
VALUES 
	(5, 1, null),
	(5, 2, null),
	(5, 3, null),
	(6, 2, '2020-01-01'),
	(6, 4, '2020-01-01'),
	(6, 5, '2020-01-01'),
	(7, 4, '2020-01-01'),
	(7, 6, '2020-01-01'),
	(8, 6, '2020-01-01'),
	(8, 7, '2020-01-01'),
	(8, 4, '2020-01-01'),
	(8, 3, '2020-01-01')
RETURNING *;

--

SELECT 
	te.nome AS nome_tecnologia, 
	te.id AS id_tecnologia,
	pr.nome AS nome_projeto,
	pr.id AS id_projeto
FROM 
	tecnologias AS te
JOIN 
	tecnologias_projetos AS tp ON te.id = tp.id_tecnologia
JOIN 
	projetos pr ON tp.id = pr.id
WHERE 
	te.nome  = 'CSS';