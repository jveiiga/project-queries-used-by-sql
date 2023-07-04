CREATE TABLE IF NOT EXISTS desenvolvedores(
	id BIGSERIAL PRIMARY KEY, 
	nome VARCHAR(50) NOT NULL, 
	emais VARCHAR(50) UNIQUE NOT NULL 
);

CREATE TABLE IF NOT EXISTS enderecos(
	id BIGSERIAL PRIMARY KEY,
	rua VARCHAR(50) NOT NULL,
	numero VARCHAR(5) NOT NULL,
	cep VARCHAR(8) NOT NULL, 
	cidade VARCHAR(50) NOT NULL ,
	estado VARCHAR(2) NOT NULL ,
	complemento VARCHAR(50)
);

--

SELECT 
	*
FROM 
	desenvolvedores;

SELECT 
	*
FROM 
	enderecos;

--

ALTER TABLE 
	desenvolvedores 
ADD COLUMN 
	id_endereco INTEGER UNIQUE;

ALTER TABLE 
	desenvolvedores 
ADD FOREIGN KEY 
	(id_endereco)
REFERENCES 
	enderecos(id)
ON DELETE SET NULL;

--
	
INSERT INTO 
	desenvolvedores(nome, emais)
VALUES 
	('Jeferson', 'jeferson@kenzie.com'),
	('Maicon', 'maicon@kenzie.com'),
	('Gustavo', 'gustavo@kenzie.com'),
	('André', 'andre@kenzie.com'),
	('Marquinhos', 'marcos@kenzie.com'),
	('Laura', 'laura@kenzie.com')
RETURNING *;

--

INSERT INTO 
	enderecos(rua, numero, cep, cidade, estado)
VALUES
	('Rua do Jeferson', '123', '1111', 'São Paulo', 'SP'),
	('Rua do Maicon', '123', '1111', 'Belo Horizonte', 'BH'),
	('Rua do Gustavo', '123', '1111', 'Nova Fatima', 'Pr')
	--('Rua do André', '123', '1111', 'São Paulo', 'SP'),
	--('Rua do Marquinhos', '123', '1111', 'Campinas', 'SP'),
	--('Rua do Laura', '123', '1111', 'Ribeirinho', 'Uberlânlia')
RETURNING *; 

--

UPDATE 
	desenvolvedores 
SET 
	id_endereco = 1
WHERE 
	emais = 'jeferson@kenzie.com';

UPDATE 
	desenvolvedores 
SET 
	id_endereco = 2
WHERE 
	emais = 'maicon@kenzie.com';

UPDATE 
	desenvolvedores 
SET 
	id_endereco = 3
WHERE 
	emais = 'gustavo@kenzie.com';

--UPDATE 
--	desenvolvedores 
--SET
--	id_endereco = (
--		SELECT id FROM enderecos WHERE rua =  'Rua do Jeferson';
--	)

-- SELECT completo

SELECT 
	*
FROM 
	desenvolvedores
JOIN 
	enderecos ON enderecos.id = desenvolvedores.id_endereco;

-- SELECT Tabelas com apelido

SELECT 
	*
FROM 
	desenvolvedores AS de
JOIN 
	enderecos AS en ON en.id = de.id_endereco;

-- SELECT campos selecionados

SELECT 
	de.id AS id_desenvolvedor,
	de.nome, 
	en.id AS id_endereco,
	en.rua,
	en.cidade
FROM 
	desenvolvedores AS de
JOIN 
	enderecos AS en ON en.id = de.id_endereco;

-- 

SELECT 
	de.nome, 
	de.emais,
	en.*
FROM 
	enderecos AS en
JOIN 
	desenvolvedores AS de ON en.id = de.id_endereco
WHERE 
	de.emais = 'jeferson@kenzie.com'; 
