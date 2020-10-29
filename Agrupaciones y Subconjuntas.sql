#RAFAEL PASCUAL CEPEDA
SHOW DATABASES;
USE tienda;
SELECT * FROM articulo;
SELECT * FROM empleado;
SELECT * FROM puesto;
SELECT * FROM venta;

#EJEMPLO LIKE:
SELECT* FROM empleado WHERE nombre LIKE 'M%a';

#RETO 1
#Qué artículos incluyen la palabra "Pasta" en su nombre?
SELECT* FROM articulo WHERE nombre LIKE '%Pasta%';
#Qué artículos incluyen la palabra "Cannelloni" en su nombre?
SELECT* FROM articulo WHERE nombre LIKE '%Cannelloni%';
#Qué nombres están separados por un guión (Puree - Kiwi)?
SELECT* FROM articulo WHERE nombre LIKE '%-%';
#Qué puestos incluyen la palabra "Designer"?
SELECT* FROM puesto WHERE nombre LIKE '%Designer%';
#Qué puestos incluyen la palabra "Developer"?
SELECT* FROM puesto WHERE nombre LIKE '%Developer%';

#EJEMPLO Func. Agrupamiento:
SELECT avg(precio) "Promedio Precio" FROM articulo;
SELECT count(*) AS "Total Artículos" FROM articulo;
SELECT max(precio) AS "Precio Máximo" FROM articulo;
SELECT min(precio) AS "Precio Máximo" FROM articulo;
SELECT sum(precio) AS "Suma Total" FROM articulo;

#RETO 2
#Cuál es el promedio de salario de los puestos?
SELECT avg(salario) "Promedio de Salario" FROM puestos;
#Cuántos artículos incluyen la palabra "Pasta" en su nombre?
SELECT count(nombre) AS "Total Artículos" FROM articulo WHERE nombre LIKE '%Pasta%';
#Cuál es el salario mínimo y máximo?
SELECT min(salario) AS "Salario Máximo", max(salario) AS "Salario Mínimo" FROM puesto;
#Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT sum(salario) AS "Suma de últimos 5 puestos agregados" FROM puesto WHERE id_puesto>(SELECT max(id_puesto)-5 FROM puesto);

#EJEMPLO Agrupamientos:
SELECT nombre, sum(precio) "Precio Total" FROM articulo GROUP BY nombre;
SELECT nombre, count(*) "Cantidad" FROM articulo GROUP BY nombre;
SELECT nombre, count(*) AS cantidad FROM articulo GROUP BY nombre ORDER BY cantidad DESC;
SELECT nombre, min(salario) "Salario Mínimo", max(salario)"Salario Máximo" FROM puesto GROUP BY nombre;

#RETO 3
#Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) "Registros" FROM puesto GROUP BY nombre;
#Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) "Pago Total" FROM puesto GROUP BY nombre;
#Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(*) "Total de ventas" FROM venta GROUP BY id_empleado;
#Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) "Total de ventas" FROM venta GROUP BY id_articulo;