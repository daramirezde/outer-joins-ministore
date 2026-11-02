# MiniStore: LEFT, RIGHT y FULL OUTER JOIN

Autor: David Ramirez Del Busto
Práctica: Outer Joins en SQL  
Motor de base de datos: Microsoft SQL Server

## 1. Objetivo

El objetivo de esta práctica es analizar la relación entre el catálogo de productos y el historial de ventas de MiniStore mediante `LEFT JOIN`, `RIGHT JOIN` y `FULL OUTER JOIN`.

Estas consultas permiten identificar productos que no han sido vendidos, ventas asociadas a productos que no existen en el catálogo y registros que no tienen correspondencia entre ambas tablas.

## 2. ¿Por qué usé LEFT JOIN en la Consulta 1 y no INNER JOIN?

Usé LEFT JOIN porque necesito conservar todos los productos del catálogo, incluso aquellos que no tienen ventas asociadas.

Si utilizara INNER JOIN, solo obtendría los productos que tienen al menos una venta coincidente. Por ejemplo, los productos 108 (Hub USB-C 7p) y 109 (Parlante Bluetooth) desaparecerían del resultado porque nunca fueron vendidos.

Con LEFT JOIN, estos productos siguen apareciendo y sus columnas correspondientes a las ventas muestran NULL. Esto permite identificar productos sin movimiento comercial y analizar el inventario que no ha generado ventas.


## 3. ¿Por qué usé RIGHT JOIN en la Consulta 2?

Usé RIGHT JOIN porque quiero conservar todas las filas de la tabla ventas, incluso si el producto vendido no existe en el catálogo.

En mi consulta, la tabla productos está a la izquierda del RIGHT JOIN y la tabla ventas está a la derecha. Por lo tanto, se conservan todas las ventas.

El ejemplo concreto es la venta 10, cuyo producto_id es 999. Como no existe un producto con ese identificador en la tabla productos, las columnas de esa tabla aparecen como `NULL`.


## 4. ¿Qué representan los valores NULL en cada resultado?

Los valores NULL indican que no existe un valor coincidente disponible en la otra tabla para esa fila.

En la Consulta 1, el producto 108 (Hub USB-C 7p) aparece con NULL en venta_id, porque no existe ninguna venta asociada a ese producto.

En la Consulta 2, la venta 10 tiene como producto_id el registro 999 en la tabla ventas, pero p.producto_id aparece como NULL porque el producto 999 no existe en el catálogo.

Por lo tanto, el significado de NULL depende de la tabla y de la relación que se está analizando.


## 5. ¿Cuándo usaría FULL OUTER JOIN en un caso real?

Usaría FULL OUTER JOIN para realizar una auditoría completa entre dos fuentes de información cuando necesito detectar tanto registros sin correspondencia en una tabla como registros sin correspondencia en la otra.

Por ejemplo, en MiniStore permitiría revisar simultáneamente los productos que no han sido vendidos y las ventas que hacen referencia a productos inexistentes.

Esta información puede ayudar al equipo de operaciones a identificar productos sin movimiento comercial, errores de registro y problemas de calidad de datos antes de construir reportes de ventas o inventario.