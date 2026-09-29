-- pre-entrega-modulo4.sql
-- Este archivo contiene mis tres consultas para el analisis del negocio
-- Cada una de mis consultas esta explicada en un lenguaje sencillo para explicar el problema a resolver.
------------------------------------------------------------------------------------------------------------------------------

--1. Rentabilidad de la categoria
-- Aqui quiero saber que categorias de los prodcutos venden mas y generan mas dinero.
-- Para ello unire las tres tablas: ventas (v), productos (p) y categorias (cat).
-- Sumare las unidades vendidas y el ingreso total por categoria.
-- Al final filtrare con HAVING para mostrar solo las categorias que superan el umbral (como pueden ser mas de 100 unidades).
------------------------------------------------------------------------------------------------------------------------------

select
cat.nombre as categoria,
SUM(v.cantidad) as unidades_vendidas,
SUM(v.cantidad * v.precio) as ingreso_total
from ventas v
join productos p on v.producto_id = p.producto_id 
join categorias cat on p.categoria_id = cat.id
group by cat.nombre
having SUM(v.cantidad) > 100; 

-- Este ultimo es mi umbral definido en 100 porque quiero enfocarme en las categorias con impacto comercial
 
------------------------------------------------------------------------------------------------------------------------------

-- 2. Clientes sin compras
-- Aqui quiero identificar a los clientes que estan registrados pero nunca han comprado nada.
-- Usare LEFT JOIN para unir a los clientes (c) con las ventas (v).
-- Si no hay coincidencia en las ventas, significa que ese cliente es el que no ha comprado.
-- Con COALESCE mostrare 0 en lugar de NULL para que sea mas claro.
------------------------------------------------------------------------------------------------------------------------------

select 
c.id,
c.nombre,
COALESCE(COUNT(v.id), 0) as compras_realizadas
from clientes c
left join ventas v on c.id = v.cliente_id 
group by c.id, c.nombre 
having COUNT(v.id) = 0;

------------------------------------------------------------------------------------------------------------------------------

-- 3. Top de compras por cliente
-- Aqui quiero saber cual es el producto que mas veces compro cada cliente, 
-- y tambien la fecha de su ultima transaccion.
-- Unire clientes (c), ventas (v) y productos (p).
-- Contare cuantas veces se compro cada producto y usare MAX para la ultima fecha.
-- Cuando use HAVING lo hare para asegurar que solo se muestre el producto mas comprado por cada cliente.
------------------------------------------------------------------------------------------------------------------------------

select
c.nombre as cliente,
p.nombre as producto,
COUNT(v.id) as veces_comprado,
MAX(v.fecha) as ultima_transaccion
from clientes c
join ventas v on c.id = v.cliente_id 
join productos p on v.producto_id = p.id 
group by c.nombre, p.nombre 
having COUNT(v.id) = (
select MAX(cnt)
from (
select COUNT(v2.id) as cnt 
from ventas v2 
where v2.cliente_id = c.id 
group by v2.producto_id 
) sub
);
