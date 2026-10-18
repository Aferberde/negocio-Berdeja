-- Consultas SQL requeridas para la gestión del negocio

-- 1. Obtener todos los productos con el nombre de su categoría (JOIN)
SELECT p.id, p.nombre AS producto, c.nombre AS categoria, p.precio, p.stock
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id;

-- 2. Listar los pedidos realizados por un cliente específico (WHERE + JOIN)
SELECT pe.id AS pedido_id, c.nombre AS cliente, pe.fecha, pe.estado
FROM pedidos pe
INNER JOIN clientes c ON pe.cliente_id = c.id
WHERE c.email = 'carlos@mail.com';

-- 3. Calcular el total gastado por cada cliente (SUM + GROUP BY + JOIN)
SELECT c.nombre AS cliente, SUM(dp.cantidad * dp.precio_unitario) AS total_gastado
FROM clientes c
INNER JOIN pedidos pe ON c.id = pe.cliente_id
INNER JOIN detalle_pedido dp ON pe.id = dp.pedido_id
GROUP BY c.id, c.nombre;

-- 4. Contar la cantidad de productos por categoría (COUNT + GROUP BY)
SELECT c.nombre AS categoria, COUNT(p.id) AS total_productos
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
GROUP BY c.id, c.nombre;