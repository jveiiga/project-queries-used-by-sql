CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS livros(
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	nome VARCHAR(200) NOT NULL,
	autor VARCHAR(200) NOT NULL,
	paginas INT NOT NULL
);

INSERT INTO 
	livros(nome, autor, paginas)
VALUES
	('Como Fazer Amigos e Influenciar Pessoas', 'Dale Carnegie', 256),
	('O Poder do Hábito', 'Charles Duhigg', 408),
	('Os 7 Hábitos das Pessoas Altamente Eficazes', 'Sthephen R. Covey', 462),
	('Mindset: A Nova Psicologia do Sucesso', 'Carol S. Dweck', 312),
	('Inteligência Emocional', 'Daniel Goleman', 384),
	('Comece Pelo Porquê', 'Simon Sinek', 256),
	('O Milagre da Manhã', 'Hal Elrod', 196),
	('A Coragem de Ser Imperfeito', 'Brené Brown', 208),
	('A tríade do tempo', 'Christian Barbosa', 208),
	('O Corpo Fala', 'Pierre Weil', 288),
	('A Arte de Ler Mentes', 'Henrik Fexeus', 256),
	('Inteligência Visual', 'Amy E. Herman', 336),
	('O Poder da Presença', 'Amy Cuddy', 256),
	('Rápido e Devagar', 'Daniel Kahneman', 608),
	('Pense de Novo', 'Adam Grant', 304),
	('A Voz na Sua Cabeça', 'Ethan Kross', 240)
RETURNING *;

-- Obter todos os dados dos livros;


SELECT 
	* 
FROM 
	livros;
	
-- Obter todos os dados dos livros com mais de 200 páginas;

SELECT 	
	*
FROM 
	livros
WHERE 
	paginas > 200;

-- Obter o nome dos livros com mais de 400 páginas;

SELECT 
	*
FROM 
	livros 
WHERE 
	paginas > 400;

-- Obter todos os dados dos livros que começam com a letra "O";

SELECT 
	*
FROM 
	livros 
WHERE 
	nome ILIKE 'o%';

-- Obter os nomes de autores que comecem com a letra "A";

SELECT 
	*
FROM 
	livros 
WHERE 
	autor ILIKE 'a%';
	
-- Obter todos os dados dos livros que começam com a letra "A" e tem mais de 250 páginas;


SELECT 
	*
FROM 
	livros 
WHERE 
	nome ILIKE 'a%' AND paginas > 250; 

-- 

SELECT 
	*
FROM 
	livros 
WHERE 
	nome ILIKE '%o';