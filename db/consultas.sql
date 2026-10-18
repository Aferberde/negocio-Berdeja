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

-- 5. Listar el detalle completo de un pedido con nombres de productos (JOINs múltiples)
SELECT dp.pedido_id, p.nombre AS producto, dp.cantidad, dp.precio_unitario, (dp.cantidad * dp.precio_unitario) AS subtotal
FROM detalle_pedido dp
INNER JOIN productos p ON dp.producto_id = p.id
WHERE dp.pedido_id = 1;

-- 6. Obtener las categorías con más de 1 producto (HAVING)
SELECT c.nombre AS categoria, COUNT(p.id) AS total_productos
FROM categorias c
INNER JOIN productos p ON c.id = p.categoria_id
GROUP BY c.id, c.nombre
HAVING COUNT(p.id) >= 1;

-- 7. Eliminar un producto sin ventas asociadas (DELETE + subconsulta)
DELETE FROM productos 
WHERE id NOT IN (SELECT DISTINCT producto_id FROM detalle_pedido) AND id = 999;