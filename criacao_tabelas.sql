CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS cursos(
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	nome VARCHAR(200) NOT NULL,
	tema VARCHAR(300) NOT NULL,
	duracao INT NOT NULL
);

--

CREATE TABLE IF NOT EXISTS livros(
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	nome VARCHAR(200) NOT NULL,
	autor VARCHAR(200) NOT NULL, 
	paginas INT NOT NULL 
);

--

CREATE TABLE IF NOT EXISTS animais(
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	nome VARCHAR(200) NOT NULL,
	especie VARCHAR(200) NOT NULL,
	raca VARCHAR(200) NOT NULL,
	idade INT NOT NULL
);

--

CREATE TABLE IF NOT EXISTS carros(
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	placa VARCHAR(10) NOT null,
	modelo VARCHAR(100) NOT NULL,
	marca VARCHAR(100) NOT NULL,
	ano INT NOT NULL,
	numero_de_donos INT NOT NULL,
	km_rodados DECIMAL NOT NULL,
	alugado bit NOT NULL
);
