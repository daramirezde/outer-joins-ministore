
-- MiniStore - Soluciones con OUTER JOINs
-- Autor: David Ramirez Del Busto
-- Fecha: 2 de noviembre de 2026

USE MiniStore;
GO

-- CONSULTA 1: LEFT JOIN
-- Mostrar todos los productos y sus ventas asociadas

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    v.venta_id,
    v.cantidad,
    v.fecha_venta
FROM productos AS p
LEFT JOIN ventas AS v
    ON p.producto_id = v.producto_id
GO

-- Pregunta de negocio: ¿Que productos del catalogo nunca fueron vendidos? Los productos 108 y 109 no se han vendido.

-- CONSULTA 2: RIGHT JOIN
-- Identificar ventas con productos que no existen
-- en el catálogo

SELECT
    v.venta_id,
    v.producto_id AS producto_id_venta,
    v.cliente_id,
    v.cantidad,
    v.fecha_venta,
    p.producto_id AS producto_id_catalogo,
    p.nombre
FROM productos AS p
RIGHT JOIN ventas AS v
    ON p.producto_id = v.producto_id
GO

-- CONSULTA 3: FULL OUTER JOIN
-- Mostrar todos los productos y todas las ventas,
-- incluso cuando no existe coincidencia

SELECT
    p.producto_id,
    p.nombre,
    v.venta_id,
    v.producto_id AS producto_id_venta,
    v.cantidad,
    v.fecha_venta
FROM productos AS p
FULL OUTER JOIN ventas AS v
    ON p.producto_id = v.producto_id
GO
