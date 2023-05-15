CREATE SCHEMA localDeRopaTexeira;
USE localDeRopaTexeira;

CREATE TABLE prenda(
	id_prenda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_prenda VARCHAR (50) NOT NULL,
    stock INT NOT NULL,
    precio NUMERIC (10,2) NOT NULL,
    id_marca INT NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
);

CREATE TABLE marca(
	id_marca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR (50) NOT NULL,
    pais_origen VARCHAR (50) NOT NULL,
    descuento INT NOT NULL
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

CREATE TABLE detalle_venta(
	id_prenda INT NOT NULL,
    FOREIGN KEY (id_prenda) REFERENCES prenda(id_prenda),
    id_venta INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    PRIMARY KEY (id_prenda, id_venta),
    cantidad_productos INT NOT NULL
);
