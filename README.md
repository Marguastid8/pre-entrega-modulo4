# pre-entrega-modulo4
Consultas multicapa en SQL para análisis de negocio

Este repositorio contiene mi archivo 'pre-entrega-modulo4.sql' con tres consultas SQL.  
Cada consulta está comentada en lenguaje sencillo para explicar qué problema del negocio resuelve.

Consultas incluidas

1. Rentabilidad por categoría  
   - Aquí quiero saber qué categorías de productos venden más y generan más dinero.  
   - Para eso uni las tablas de ventas, productos y categorías.  
   - Sume las unidades vendidas y el ingreso total por categoría.  
   - Al final use HAVING para mostrar solo las categorías que superan el umbral (ejemplo: más de 100 unidades).  

2. Clientes sin compras
   - Aquí quise identificar a los clientes que están registrados pero nunca han comprado nada.  
   - Use LEFT JOIN para unir clientes con ventas.  
   - Si no hay coincidencia, significa que ese cliente no ha comprado.  
   - Con COALESCE mostre 0 en lugar de NULL para que sea más claro.  

3. Top de compras por cliente
   - Aquí queria saber cuál es el producto que más veces compró cada cliente y la fecha de su última transacción.  
   - Uni los clientes, ventas y productos.  
   - Conté cuántas veces se compró cada producto y usé MAX para la última fecha.  
   - HAVING aseguró que se mostrara solo el producto más comprado por cada cliente.  

Criterios de aceptación cumplidos
- Uso de alias de tabla en todas las consultas (ej. 'v' para ventas, 'c' para clientes).  
- GROUP BY en cada consulta con funciones agregadas.  
- Filtrado de agregados con HAVING.  
- Manejo de nulos con COALESCE en LEFT JOIN.  
- Comentarios claros explicando el problema del negocio.  

--- Entregable
La entrega es el URL público de este repositorio en GitHub.
