CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS instrutores(
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	nome VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	idade INT,
	modulo varchar(2) NOT NULL
);

--

INSERT INTO 
	instrutores(nome, email, modulo)
VALUES
	('Jeferson', 'jeferson@kenzie.com', 'M4');
	
--

SELECT
	*
FROM 
	instrutores;

--

INSERT INTO 
	instrutores(nome, email, idade, modulo)
VALUES
	('Pablo', 'pablo@kenzie.com', 25, 'M4'),
	('Maykel', 'maykel@kenzie.com', 25, 'M6'),
	('Luiz', 'luiz@kenzie.com', 25, 'M5'),
	('Felipe', 'felipe@kenzie.com', 25, 'M5')
RETURNING *;

--

SELECT 
	nome, email 
FROM 
	instrutores;

-- 

SELECT
	*
FROM 
	instrutores
WHERE 
	modulo = 'M4';

--

SELECT 
	nome, idade
FROM
	instrutores
WHERE 
	modulo <> 'M4';

--

SELECT 
	*
FROM 
	instrutores 
WHERE 
	idade < 30;

--

SELECT 
	*
FROM 
	instrutores
WHERE 
	idade = 25 AND modulo = 'M6'; 

--

SELECT 
	*
FROM 
	instrutores
WHERE
	(modulo = 'M6' OR modulo = 'M5'); -- AND idade = 21

--
	
SELECT 
	*
FROM 
	instrutores
WHERE 
	nome LIKE '%b%'; -- LIKE case sensitive

--
	
SELECT 
	*
FROM 
	instrutores
WHERE 
	nome ILIKE '%B%'; -- lower e upper 

--
	
SELECT 
	*
FROM
 	instrutores
WHERE 
 	email LIKE '%kenzie.com%'; 
 
 --
 
 SELECT 
	*
FROM
 	instrutores
WHERE 
 	idade IS NULL; 
 
 --
 
 SELECT
	*
FROM 
	instrutores;

 -- Nova coluna 
 
 ALTER TABLE 
 	instrutores
 ADD COLUMN 
 	nova_coluna INT;
 
-- Regras nova coluna 

 ALTER TABLE 
 	instrutores 
 ADD CONSTRAINT 
 	unique_email  UNIQUE (email);	
 
 -- Renomear coluna 
 
 ALTER TABLE 
 	instrutores 
 RENAME COLUMN
 	nova_coluna TO nova_coluna_renomeada;
 
 -- Deletando coluna 
 
 ALTER TABLE 
 	instrutores 
 DROP COLUMN
	nova_coluna_renomeada;

--

ALTER TABLE 
	instrutores 
ADD COLUMN 
	admissao TIMESTAMP;

--

ALTER TABLE 
	instrutores 
ADD COLUMN 
	salario DECIMAL(10, 2);

--

-- Atualizando campo

UPDATE 
	instrutores 
SET 
	admissao = '2020-01-01';

-- 

ALTER TABLE 
	instrutores 
ALTER COLUMN 
	admissao TYPE DATE;

--

UPDATE 
	instrutores 
SET 
	email = 'fabio2@kenzie.com'
WHERE 
	id = '8ef9ef10-9ff2-4e9b-805a-c1164628b6ef';

--

UPDATE 
	instrutores 
SET 
	modulo = 'M3',
	salario = 1000.01
WHERE 
	id = 'aa0390f6-2bcb-4dd8-8338-024f466c0bad'
RETURNING *;

-- Deletando usuário/linha  

DELETE FROM 
	instrutores 
WHERE 
	idade IS NULL
RETURNING *;

-- Atualizando diversos usuários

UPDATE 
	instrutores 
SET 
	salario = 1500.50
WHERE 
	modulo = 'M4'
RETURNING *;

-- Funções built-in

SELECT 
	MIN(salario) AS menor_salario
FROM 
	instrutores;

--

SELECT 
	MAX(salario) AS  maior_salario
FROM 
	instrutores;

--

SELECT 
	ROUND(AVG(salario), 2) AS media_salario
FROM 
	instrutores;

--

SELECT 
	id, 
	nome
FROM 
	instrutores
WHERE 
	idade = (
		SELECT MAX(idade) FROM instrutores
	);

--

SELECT 
	*
FROM 
	instrutores
ORDER BY 
	modulo;

--

SELECT 
	*
FROM 
	instrutores
ORDER BY 
	modulo DESC; -- ou ASC

-- 
	
SELECT 
	COUNT(*) AS quantidade_instrutores, 
	modulo
FROM 
	instrutores
GROUP BY
	modulo;

--

UPDATE 
	instrutores 
SET 
	modulo = 'm4'
WHERE 
	email = 'luiz@kenzie.com';

--

SELECT 
	COUNT(*) AS quantidade_instrutores, 
	UPPER(modulo)
FROM 
	instrutores
GROUP BY
	UPPER(modulo);

--

SELECT 
	MAX(salario)
FROM 
	instrutores
WHERE 
	modulo ILIKE 'M4';

--

SELECT 
	nome, char_length(nome) AS caracteres
FROM 
	instrutores
ORDER BY 
	caracteres DESC; 