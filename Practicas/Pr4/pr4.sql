

CREATE TABLE Peliculas(
    id_pelicula INT, 
	titulo VARCHAR(100) NOT NULL,
    id_director INT NOT NULL,
    PRIMARY KEY(id_pelicula),
    UNIQUE (id_pelicula, titulo)
);

CREATE TABLE Directores(
	id_director INT UNIQUE,
    idada INT CHECK (idade>0 AND idade<=108),
	nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_director),
	FOREIGN KEY(id_director) REFERENCES Peliculas(id_director)
);
CREATE TABLE Actores(
	id_actor INT UNIQUE,
    idade INT CHECK (idade>0 AND idade<=108),
	nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_actor)
);
CREATE TABLE ActoresPeliculas(
	id_actor INT, 
    id_pelicula INT,
    PRIMARY KEY(id_actor, id_pelicula),
    FOREIGN KEY(id_actor) REFERENCES Actores(id_actor),
    FOREIGN KEY(id_pelicula) REFERENCES Peliculas(id_pelicula)
);
INSERT INTO Actores (nome, id_actor, idade) VALUES
	('Russell Crowe', 128, 56),
    ('Robert Downey Jr', 375, 55),
    ('Tom Holland', 618, 24),
    ('Gwyneth Paltrow', 569, 48),
    ('Matthew McConaughey', 190, 52),
    ('Matt Damon', 354, 51),
    ('Mark Hamill', 434, 70),
    ('Carrie Fisher', 402, 60),
    ('Harrison Ford', 148, 79),
    ('Hayden Christensen', 789, 40);
INSERT INTO Peliculas(id_pelicula, titulo, id_director) VALUES
	(0172495, 'Gladiator', 631),
    (0371746, 'Iron Man', 939),
    (6320628, 'SpiderMan', 939),
    (6427523, 'La vida de Bryan', 432),
    (4154796, 'Los vengadores: Endgame', 939),
    (816692,  'Interstellar', 4240),
    (76759,   'Star Wars: A new hope', 184),
    (3659388, 'The Martian', 631);
INSERT INTO Directores(nome, id_director, idade) VALUES
	('Ridley Scott', 631, 83),
    ('Marvel - Hermanos Russo', 939, 85),
    ('Christopher Nolan', 4240, 50),
    ('George Lucas', 184, 75),
    ('Monthy Pyton', 432, 68);
INSERT INTO ActoresPeliculas(id_actor, id_pelicula) VALUES
	(128,0172495),(375,0371746),(375,4154796),
    (618,6320628),(618,4154796),(569,0371746),
    (569,4154796),(190,816692),(354,816692),
    (434,76759),(402,76759),(148,76759),(354,3659388);


-- Views
CREATE VIEW View6 AS SELECT Peliculas.titulo, Peliculas.nacionalidad FROM Peliculas;
SELECT * FROM View6;
SELECT titulo FROM View6;

CREATE VIEW View7 AS
SELECT Peliculas.titulo, Peliculas.nacionalidad, Actores.id_actor, Directores.id_director FROM Peliculas
JOIN Directores ON Directores.id_director = Peliculas.id_director
JOIN ActoresPeliculas ON Peliculas.id_pelicula=ActoresPeliculas.id_pelicula
JOIN Actores        ON Actores.id_actor=ActoresPeliculas.id_actor;
SELECT * FROM View7;

CREATE VIEW View8 AS
SELECT Peliculas.titulo FROM Peliculas WHERE Peliculas.nacionalidad='USA';
SELECT * FROM View8;