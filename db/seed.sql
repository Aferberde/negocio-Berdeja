-- Inserción de datos de prueba

INSERT INTO categorias (nombre) VALUES 
('Electrónica'), 
('Ropa'), 
('Hogar');

INSERT INTO productos (nombre, categoria_id, precio, stock) VALUES 
('Laptop Dell', 1, 850.00, 10),
('Camiseta Algodón', 2, 15.50, 50),
('Cafetera Express', 3, 120.00, 15);