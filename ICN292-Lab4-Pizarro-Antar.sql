DROP DATABASE IF EXISTS austral;
CREATE DATABASE austral;
USE austral;

CREATE TABLE autores (
id_autor INT AUTO_INCREMENT,
nombre VARCHAR(80) NOT NULL,
pais VARCHAR(60),
genero ENUM('Cómic','Ensayo', 'Infantil', 'Novela','Poesía') NOT NULL,
PRIMARY KEY (id_autor)
);

CREATE TABLE colecciones (
id_coleccion INT AUTO_INCREMENT,
titulo VARCHAR(80) NOT NULL,
fecha_publicacion DATE,
PRIMARY KEY (id_coleccion)
);

CREATE TABLE libros (
id_libro INT AUTO_INCREMENT,
id_autor INT,
Id_coleccion INT,
titulo VARCHAR(120) NOT NULL,
paginas INT,
ejemplares_vendidos INT,
anio INT,
PRIMARY KEY (id_libro),
FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
FOREIGN KEY (id_coleccion) REFERENCES colecciones(id_coleccion)
);

CREATE TABLE pagos (
id_pago INT AUTO_INCREMENT,
id_autor INT,
fecha_pago DATE,
monto DECIMAL(10,2),
PRIMARY KEY (id_pago),
FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

INSERT INTO autores (nombre, pais, genero) VALUES
('Elena Pizarro', 'Chile', 'Novela'),
('Harold Finch', 'Inglaterra', 'Ensayo'),
('Rodrigo Bahamonde', 'Chile', 'Poesía'),
('Valentina Correa', 'Argentina', 'Infantil'),
('Nora Keller', 'Estados Unidos', 'Novela'),
('Kenji Arakawa', NULL, 'Cómic');

INSERT INTO colecciones (titulo, fecha_publicacion) VALUES
('Colección Nacional', '2025-09-18'),
('Colección Internacional', '2026-02-13');

INSERT INTO libros (id_autor, id_coleccion, titulo, paginas, ejemplares_vendidos, anio) VALUES
(1, 1, 'Cielo de Enero', 210, 1500, 2024),
(1, 1, 'Marea Baja', 185, 800, 2023),
(1, 1, 'El Norte', 200, 2200, 2024),
(2, 2, 'Estrellas que Caen', 240, 3000, 2022),
(2, 2, 'Máquinas', 215, 450, 2024),
(3, 1, 'Luz Artificial', 300, 1200, 2024),
(3, 1, 'Ruido Blanco', 280, 600, 2023),
(4, 2, 'El Barrio de Lila', 190, 5000, 2024),
(4, 2, 'Antes del Amanecer', 205, 2700, 2024),
(4, 2, 'La Calle 8', 175, 900, 2023),
(5, 2, 'Flor de Hierro', 195, 4100, 2024),
(5, 2, 'Hora Dorada', 220, 1800, 2022);

INSERT INTO pagos (id_autor, fecha_pago, monto) VALUES
(1, '2026-10-20', 10990),
(3, '2026-10-20', 50000),
(4, '2026-10-22', 13590),
(1, '2026-10-22', 10990),
(5, '2026-10-30', 24990),
(4, '2026-10-30', 30000),
(1, '2026-10-30', 12990);