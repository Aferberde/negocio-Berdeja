-- Inserción de datos de prueba

INSERT INTO categorias (nombre) VALUES 
('Electrónica'), 
('Ropa'), 
('Hogar');

INSERT INTO productos (nombre, categoria_id, precio, stock) VALUES 
('Laptop Dell', 1, 850.00, 10),
('Camiseta Algodón', 2, 15.50, 50),
('Cafetera Express', 3, 120.00, 15);
INSERT INTO clientes (nombre, telefono, email) VALUES 
('Carlos Pérez', '71234567', 'carlos@mail.com'),
('Ana Gómez', '77654321', 'ana@mail.com');

INSERT INTO pedidos (cliente_id, estado) VALUES 
(1, 'Completado'),
(2, 'Pendiente');

INSERT INTO detalle_pedido (pedido_id, producto_id, cantidad, precio_unitario) VALUES 
(1, 1, 1, 850.00),
(1, 2, 2, 15.50),
(2, 3, 1, 120.00);