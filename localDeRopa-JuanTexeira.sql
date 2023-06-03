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
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
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
*/
/*
DROP TABLE detalle_venta;
DROP TABLE venta;
DROP TABLE cliente;
DROP TABLE vendedor;
DROP TABLE prenda;
DROP TABLE marca;
*/





