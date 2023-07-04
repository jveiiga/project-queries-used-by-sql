
CREATE TABLE IF NOT EXISTS carros(
	placa VARCHAR(10) PRIMARY KEY,
	modelo VARCHAR(100),
	marca VARCHAR(100),
	ano INT,
	numero_de_donos INT,
	km DECIMAL(10, 2) 
);

--

SELECT 
	*
FROM 
	carros;

--

INSERT INTO  
	carros(placa, marca, modelo, ano, numero_de_donos, km) 
VALUES 	
	('ITH2662', 'Palio', 'Fiat', 1999, 3, 120004.50),
	('JTT0001', 'Uno', 'Fiat', 1998, 5, 200147.50),
	('TJI4875', 'Corsa', 'Chevrolet', 2005, 3, 100111.15),
	('ADS5545', 'Celta', 'Chevrolet', 2001, 2, 80078.50),
	('IJT4A55', 'Fiorino', 'Fiat', 2004, 3, 212000.50),
	('GAE1554', 'Clio', 'Renault', 2007, 2, 112000.50),
	('IIR5552', '206', 'Renault', 2011, 1, 70400.50)
RETURNING *;

-- Alterar o nome da coluna "model" para "modelo";

ALTER TABLE 
	carros 
RENAME COLUMN 
	model TO modelo;

-- Alterar o nome da coluna "km" para "km_rodado";

ALTER TABLE 
	carros 
RENAME COLUMN
	km TO km_rodado;

-- Criar uma nova coluna chamada "alugado", ela deve ser um booleano 
-- e começar com todos os valores em falso;

ALTER TABLE 
	carros 
ADD COLUMN 
	alugado BOOLEAN; 

UPDATE 
	carros 
SET 
	alugado = FALSE;

-- Adicionar a regra "Não nulo" na coluna de "km_rodado";

ALTER TABLE 
	carros 
ALTER COLUMN
	km_rodado SET NOT NULL; 

-- Tentar alterar o valor do "numero_de_donos" do carro de placa "JTT0001" para nulo;

UPDATE 
	carros 
SET 
	numero_de_donos = NULL 
WHERE 
	placa = 'JTT0001';

-- Tirar a regra "Não nulo" na coluna de "numero_de_donos";

ALTER TABLE 
	carros 
ALTER COLUMN 
	numero_de_donos
DROP NOT NULL; 

-- Tentar alterar o valor do "numero_de_donos" do carro de placa "JTT0001" para nulo novamente;


UPDATE 
	carros 
SET
	numero_de_donos = NULL 
WHERE 
	placa = 'JTT0001';

-- Mudar a o valor da coluna "alugado" de falso para true no carro de placa "IJT4A55";

UPDATE 
	carros 
SET 
	alugado = TRUE 
WHERE 
	placa = 'IJT4A55';

-- Mudar a o valor da caluna "marca" de "Renault" para "Peugeot" no carro de placa "IIR5552";

UPDATE 
	carros 
SET 
	modelo = 'Peugeot'
WHERE 
	placa = 'IIR5552';

-- Excluir a coluna de "km_rodado";

ALTER TABLE 
	carros 
DROP COLUMN 
	km_rodado;

-- Excluir o valor da coluna "numero_de_donos" de todos os carros que tenham o nome 
-- começando com a letra "C";

DELETE FROM 
	carros 
WHERE 
	nome ILIKE 'c%';