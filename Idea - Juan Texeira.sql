CREATE SCHEMA localDeRopaTexeira;
USE localDeRopaTexeira;

CREATE TABLE marca(
	id_marca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR (50) NOT NULL,
    pais_origen VARCHAR (50) NOT NULL,
    descuento INT NOT NULL
);

CREATE TABLE prenda(
	id_prenda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_prenda VARCHAR (50) NOT NULL,
    stock INT NOT NULL,
    precio NUMERIC (10,2) NOT NULL,
    id_marca INT NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca) ON DELETE CASCADE
);

CREATE TABLE vendedor(
	id_vendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_vendedor VARCHAR (50) NOT NULL,
    email_vendedor VARCHAR (50) NOT NULL,
    domicilio_vendedor VARCHAR (50) NOT NULL
);

CREATE TABLE cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR (50) NOT NULL,
    email_cliente VARCHAR (50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    domicilio_cliente VARCHAR (50) NOT NULL,
    telefono VARCHAR (50) NOT NULL
);

CREATE TABLE venta(
	id_venta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT NOT NULL,
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    fecha_venta DATE NOT NULL DEFAULT (CURRENT_DATE),
    monto NUMERIC (10,2) NOT NULL
);

CREATE TABLE detalle_venta(
	id_prenda INT NOT NULL,
    FOREIGN KEY (id_prenda) REFERENCES prenda(id_prenda),
    id_venta INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    PRIMARY KEY (id_prenda, id_venta),
    cantidad_productos INT NOT NULL
);


INSERT INTO marca (nombre_marca, pais_origen, descuento) VALUES
    ('Nike', 'USA', 10),
    ('Adidas', 'Germany', 15),
    ('Puma', 'Germany', 12),
    ('Levi''s', 'USA', 20),
    ('Gucci', 'Italy', 8),
    ('Rolex', 'Switzerland', 5),
    ('Apple', 'USA', 0),
    ('Samsung', 'South Korea', 10),
    ('Sony', 'Japan', 15),
    ('HP', 'USA', 12);
    
INSERT INTO cliente (nombre_cliente, email_cliente, fecha_nacimiento, domicilio_cliente, telefono) VALUES
    ('Robert Johnson', 'robert.johnson@example.com', '1980-05-10', '123 Main St, City', '555-1234'),
    ('Jennifer Davis', 'jennifer.davis@example.com', '1992-12-15', '456 Elm St, City', '555-5678'),
    ('William Smith', 'william.smith@example.com', '1985-07-20', '789 Oak St, City', '555-9012'),
    ('Amanda Brown', 'amanda.brown@example.com', '1998-02-28', '321 Pine St, City', '555-3456'),
    ('Michael Wilson', 'michael.wilson@example.com', '1983-09-05', '654 Maple St, City', '555-7890'),
    ('Jessica Taylor', 'jessica.taylor@example.com', '1990-04-18', '987 Cedar St, City', '555-2345'),
    ('David Anderson', 'david.anderson@example.com', '1975-11-30', '543 Birch St, City', '555-6789'),
    ('Sarah Thomas', 'sarah.thomas@example.com', '1994-08-12', '876 Walnut St, City', '555-0123'),
    ('Christopher Brown', 'christopher.brown@example.com', '1988-03-25', '135 Spruce St, City', '555-4567'),
    ('Laura Martinez', 'laura.martinez@example.com', '1982-10-08', '768 Cherry St, City', '555-8901');    
    
INSERT INTO vendedor (nombre_vendedor, email_vendedor, domicilio_vendedor) VALUES
    ('John Doe', 'john.doe@example.com', '123 Main St, City'),
    ('Jane Smith', 'jane.smith@example.com', '456 Elm St, City'),
    ('David Johnson', 'david.johnson@example.com', '789 Oak St, City'),
    ('Emily Davis', 'emily.davis@example.com', '321 Pine St, City'),
    ('Michael Wilson', 'michael.wilson@example.com', '654 Maple St, City'),
    ('Jessica Brown', 'jessica.brown@example.com', '987 Cedar St, City'),
    ('Daniel Taylor', 'daniel.taylor@example.com', '543 Birch St, City'),
    ('Sarah Anderson', 'sarah.anderson@example.com', '876 Walnut St, City'),
    ('Christopher Thomas', 'christopher.thomas@example.com', '135 Spruce St, City'),
    ('Laura Martinez', 'laura.martinez@example.com', '768 Cherry St, City');
    

INSERT INTO prenda (nombre_prenda, stock, precio, id_marca) VALUES
    ('T-Shirt', 100, 29.99, 1),
    ('Sneakers', 50, 99.99, 2),
    ('Jeans', 80, 59.99, 3),
    ('Hoodie', 70, 49.99, 4),
    ('Watch', 20, 199.99, 5),
    ('Laptop', 10, 999.99, 6),
    ('Camera', 30, 499.99, 7),
    ('Bottle', 200, 9.99, 8),
    ('Soft Drink', 150, 1.99, 9),
    ('Headphones', 50, 79.99, 10);

INSERT INTO venta (id_vendedor, id_cliente, fecha_venta, monto) VALUES
    (1, 1, '2023-05-01', 100.00),
    (2, 3, '2023-05-02', 250.00),
    (3, 2, '2023-05-03', 150.00),
    (4, 5, '2023-05-04', 75.00),
    (5, 4, '2023-05-05', 200.00),
    (6, 7, '2023-05-06', 50.00),
    (7, 6, '2023-05-07', 300.00),
    (8, 9, '2023-05-08', 125.00),
    (9, 8, '2023-05-09', 180.00),
    (10, 10, '2023-05-10', 80.00);
    
INSERT INTO detalle_venta (id_prenda, id_venta, cantidad_productos) VALUES
    (1, 1, 2),
    (2, 3, 1),
    (3, 2, 3),
    (4, 5, 2),
    (5, 4, 1),
    (6, 7, 4),
    (7, 6, 2),
    (8, 9, 3),
    (9, 8, 1),
    (10, 10, 2);
    
/*
SELECT * FROM marca;
SELECT * FROM prenda;
SELECT * FROM vendedor;
SELECT * FROM cliente;
SELECT * FROM venta;
SELECT * FROM detalle_venta;

/*
DROP TABLE detalle_venta;
DROP TABLE venta;
DROP TABLE cliente;
DROP TABLE vendedor;
DROP TABLE prenda;
DROP TABLE marca;
*/

#Muestra la cantidad de ventas por vendedor
CREATE VIEW ventas_por_vendedor AS
SELECT venta.id_vendedor, vendedor.nombre_vendedor, COUNT(*) AS cantidad_ventas
FROM venta
INNER JOIN vendedor ON venta.id_vendedor = vendedor.id_vendedor
GROUP BY venta.id_vendedor, vendedor.nombre_vendedor;

#Muestra la cantidad de clientes que realizaron compras
CREATE VIEW clientes_con_compras AS
SELECT c.id_cliente, c.nombre_cliente, c.email_cliente
FROM cliente AS c
INNER JOIN venta AS v ON c.id_cliente = v.id_cliente;

#Muestra aquellas marcas que tienen un porcentaje de descuento aplicado
CREATE VIEW marcas_con_descuento AS
SELECT *
FROM marca
WHERE descuento > 0;

#Muetras el stock de prendas que hay por cada marca
CREATE VIEW stock_prendas_por_marca AS
SELECT m.nombre_marca, SUM(p.stock) AS stock_total
FROM marca AS m
INNER JOIN prenda AS p ON m.id_marca = p.id_marca
GROUP BY m.nombre_marca;

#Muestra la cantidad de ventas que se realizaron en tal mes del año
CREATE VIEW ventas_por_mes AS
SELECT MONTH(fecha_venta) AS mes, YEAR(fecha_venta) AS anio, COUNT(*) AS cantidad_ventas
FROM venta
GROUP BY mes, anio;

SELECT * FROM ventas_por_vendedor;
SELECT * FROM clientes_con_compras;
SELECT * FROM marcas_con_descuento;
SELECT * FROM stock_prendas_por_marca;
SELECT * FROM ventas_por_mes;

#Calcula la edad del cliente en base a la fecha de nacimiento y la fecha actual

DELIMITER $$
CREATE FUNCTION calcular_edad_cliente(p_fecha_nacimiento DATE)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE edad INT;
    SET edad = YEAR(CURRENT_DATE()) - YEAR(p_fecha_nacimiento);
    IF MONTH(CURRENT_DATE()) < MONTH(p_fecha_nacimiento) THEN
        SET edad = edad - 1;
    ELSEIF MONTH(CURRENT_DATE()) = MONTH(p_fecha_nacimiento) AND DAY(CURRENT_DATE()) < DAY(p_fecha_nacimiento) THEN
        SET edad = edad - 1;
    END IF;
    RETURN edad;
END;
$$
DELIMITER ;

#Calcula el precio final del prodcuto, pasandole como parámetros, el precio inicial del producto y el porcentaje de descuento a aplicar

DELIMITER $$
CREATE FUNCTION calcular_precio_con_descuento(p_precio NUMERIC(10,2), p_descuento INT)
RETURNS NUMERIC(10,2) DETERMINISTIC
BEGIN
    DECLARE precio_con_descuento NUMERIC(10,2);
    SET precio_con_descuento = p_precio - (p_precio * (p_descuento / 100.0));
    RETURN precio_con_descuento;
END;
$$
DELIMITER ;

select calcular_edad_cliente('1999-08-07');
select calcular_precio_con_descuento(1000, 15);

#Ordena los registros de la tabla marcas según X campo que se pase como parámetro

DELIMITER $$
CREATE PROCEDURE ordenarMarcas (IN campoOrdenamiento VARCHAR(45), IN orden VARCHAR(4))
BEGIN
    SET @query = CONCAT('SELECT * FROM marca ORDER BY ', campoOrdenamiento, ' ', orden);
    PREPARE runSQL FROM @query;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END 
$$
DELIMITER ;

call ordenarMarcas('descuento', 'DESC');

#Inserta los datos de una venta realizada en la tabla venta y detalle_venta

DELIMITER $$
CREATE PROCEDURE insertarVenta (
    IN p_id_vendedor INT,
    IN p_id_cliente INT,
    IN p_fecha_venta DATE,
    IN p_monto NUMERIC(10,2),
    IN p_id_prenda INT,
    IN p_cantidad_productos INT
)
BEGIN
	DECLARE v_id_venta INT;
    
    INSERT INTO venta (id_vendedor, id_cliente, fecha_venta, monto)
    VALUES (p_id_vendedor, p_id_cliente, p_fecha_venta, p_monto);
    
    SET v_id_venta = LAST_INSERT_ID();
    
    INSERT INTO detalle_venta (id_prenda, id_venta, cantidad_productos)
    VALUES (p_id_prenda, v_id_venta, p_cantidad_productos);
END 
$$
DELIMITER ;

call insertarVenta(1, 1, '1999-08-07', 50000, 2, 2);

SELECT * FROM venta;
SELECT * FROM detalle_venta ORDER BY id_venta ASC;

#Se crea la tabla de auditoría y su trigger respectivo, para que esta se complete cada vez que se realiza un INSERT en la tabla "marca"

CREATE TABLE audits (
	ID_log INT PRIMARY KEY auto_increment,
    entity varchar(100),
    entity_id int,
    insert_dt datetime,
    created_by varchar(100),
    last_updated_dt datetime,
    last_updated_by varchar(100)
);

DELIMITER $$
CREATE TRIGGER tr_insert_marca_aud
AFTER INSERT ON marca
FOR EACH ROW
INSERT INTO audits (entity, entity_id, insert_dt, created_by, last_updated_dt, last_updated_by)
VALUES ('marca', NEW.id_marca, CURRENT_TIMESTAMP(), USER(), CURRENT_TIMESTAMP(), USER());
$$
DELIMITER ;

INSERT INTO marca (nombre_marca, pais_origen, descuento) VALUES
    ('Zara', 'Spain', 10),
    ('H&M', 'Sweden', 15);
    
SELECT * FROM audits

#Al realizar un insert en la tabla "marca" en caso de que el descuento sea mayor a 100 lo setea en 100, y en caso de ser menor a 0 lo setea en 0

DELIMITER $$
CREATE TRIGGER validacion_marca
BEFORE INSERT ON marca
FOR EACH ROW
BEGIN
	IF NEW.descuento < 0 THEN
		set NEW.descuento = 0;
	ELSEIF NEW.descuento > 100 THEN
		set NEW.descuento = 100;
	END IF;
END
$$
DELIMITER ;

INSERT INTO marca (nombre_marca, pais_origen, descuento) VALUES
    ('Puma', 'Germany', -5);
    
SELECT * FROM marca;

#Crea al usuario llamado "usuarioL" el cual va a tener permisos de lectura.
CREATE USER usuarioL@localhost IDENTIFIED BY '1234';

#Crea al usuario llamado "usuarioLIM" el cual va a tener permisos de lectura, inserción y modificación de datos.
CREATE USER usuarioLIM@localhost IDENTIFIED BY '1234';

#Le otorgo permisos de lectura en el schema 'localderopatexeira' al 'usuarioL'.
GRANT SELECT ON localderopatexeira.* TO usuarioL@localhost;

#Le otorgo permisos de lectura, inserción y modificación en el schema 'localderopatexeira' al 'usuarioLIM'.
GRANT SELECT, INSERT, UPDATE ON localderopatexeira.* TO usuarioLIM@localhost;

SHOW GRANTS FOR usuarioL@localhost;
SHOW GRANTS FOR usuarioLIM@localhost;

-- Primera transacción
START TRANSACTION;

INSERT INTO vendedor (nombre_vendedor, email_vendedor, domicilio_vendedor)
VALUES ('Leonardo DiCaprio', 'leonardo@example.com', 'Los Angeles, USA'),
('Scarlett Johansson', 'scarlett@example.com', 'New York City, USA'),
('Brad Pitt', 'brad@example.com', 'Los Angeles, USA');

SELECT * FROM vendedor;

-- ROLLBACK;
-- COMMIT; (sentencia comentada)



-- Segunda transacción
START TRANSACTION;

INSERT INTO marca (nombre_marca, pais_origen, descuento)
VALUES ('Prada', 'Italy', 0),
('Lacoste', 'France', 10),
('Calvin Klein', 'USA', 15),
('Diesel', 'Italy', 12);

SAVEPOINT savepoint1;

INSERT INTO marca (nombre_marca, pais_origen, descuento)
VALUES ('Ralph Lauren', 'USA', 20),
('Tommy Hilfiger', 'USA', 25),
('Versace', 'Italy', 8),
('Chanel', 'France', 5);

SAVEPOINT savepoint2;

-- RELEASE SAVEPOINT savepoint1;

COMMIT;