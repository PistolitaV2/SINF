-- Procedementos almacenados pr3


-- 1
DROP PROCEDURE IF EXISTS listar_directores_peliculas;
DELIMITER //
CREATE PROCEDURE listar_directores_peliculas()
BEGIN
    SELECT Peliculas.titulo, Directores.nome FROM Peliculas JOIN Directores ON Peliculas.id_director=Directores.id_director
    ORDER BY Peliculas.titulo;
END //
DELIMITER ;

CALL listar_directores_peliculas();

-- 2
DROP PROCEDURE IF EXISTS contar_directores;
DELIMITER //
CREATE PROCEDURE contar_directores()
BEGIN
    DECLARE contador INT;
    CREATE TABLE IF NOT EXISTS contaDirectores(
        id_tabla INT NOT NULL AUTO_INCREMENT,
        instante TIMESTAMP,
        contaje INT,
        PRIMARY KEY(id_tabla)
    );
    SELECT COUNT(Directores.nome) INTO @contador FROM Directores;
    INSERT INTO contaDirectores(contaje, instante) VALUES
    (@contador, CURRENT_TIMESTAMP());
    SELECT * FROM contaDirectores;
END //
DELIMITER ;

-- 3
DECLARE chamadas_contar_directores INT;

-- No final de contar_directores;
SET @chamadas_contar_directores = @chamadas_contar_directores + 1;

-- 4
DELIMITER // 
CREATE PROCEDURE consultaPorNacionalidad(IN nacionalidadIN VARCHAR(100))
BEGIN  
    SELECT * FROM Peliculas  WHERE Peliculas.nacionalidad  = nacionalidadIN;
    SELECT * FROM Directores WHERE Directores.nacionalidad = nacionalidadIN;
    SELECT * FROM Actores    WHERE Actores.nacionalidad    = nacionalidadIN;
END //
DELIMITER ;

CALL consultaPorNacionalidad("Inglaterra");

-- 5
DELIMITER //
CREATE PROCEDURE peliculasPorNacionalidad(IN nacionalidadIN VARCHAR (100), OUT peliculasOUT INT)
BEGIN  
    SELECT COUNT(Peliculas.nacionalidad) INTO peliculasOUT FROM Peliculas WHERE Peliculas.nacionalidad=nacionalidadIN;
END //
DELIMITER ;

CALL peliculasPorNacionalidad("USA", @NumeroDePeliculas);
SELECT @NumeroDePeliculas;


-- 6
DELIMITER //
CREATE PROCEDURE ponerEnMaiusculas(INOUT cadena VARCHAR(100))
BEGIN
    SET cadena = UCASE(@cadena);
END //
DELIMITER ; 

CALL ponerEnMaiusculas(@cadena);
SELECT @cadena;


-- Desactivar a xestión automática
SET autocommit = 0;

-- Triggers
