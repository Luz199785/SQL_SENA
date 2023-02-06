Consultar los libros de la editorial norma Where
SELECT * FROM libro WHERE EDITORIAL = "NORMA" 

Ordenar la editorial de los libros  ORDER By
SELECT * FROM LIBRO,autor_libro,autor WHERE LIBRO.ID_LIBRO=autor_libro.ID_LIBRO AND autor_libro.ID_AUTOR=autor.ID_AUTOR
ORDER BY libro.EDITORIAL DESC


Ordenar los ejemplares por localizacion
SELECT * FROM ejemplar ORDER BY `ejemplar`.`LOCALIZACION`


Ordenar la fecha de los prestamos
SELECT * FROM prestamo order by FECHA_PRESTAMO

Consultar los prestamos del mes de enero Between
SELECT * FROM PRESTAMO WHERE FECHA_PRESTAMO>="2023-01-01" AND FECHA_PRESTAMO<="2023-01-31" ORDER BY FECHA_PRESTAMO
SELECT * FROM PRESTAMO WHERE FECHA_PRESTAMO BETWEEN "2023-01-01" AND "2023-01-31" ORDER BY FECHA_PRESTAMO


Autores que empiezan por la letra P like
SELECT * FROM AUTOR WHERE NOMBRE LIKE "P%" 

Cosultar los prestamos de los ejemplares 1, 3 y 5 IN
SELECT * FROM PRESTAMO WHERE ID_EJEMPLAR =1 OR ID_EJEMPLAR=3 OR ID_EJEMPLAR=5
SELECT * FROM PRESTAMO WHERE ID_EJEMPLAR IN(1,3,5) 

Cual es el libro que tienen mas paginas MAX
SELECT TITULO,MAX(PAGINAS) FROM LIBRO WHERE PAGINAS=(SELECT MAX(PAGINAS) FROM LIBRO) 

Cual es el libro que tienen menos paginas MIN
SELECT TITULO,MIN(PAGINAS) FROM LIBRO WHERE PAGINAS=(SELECT MIN(PAGINAS) FROM LIBRO) 



Cual es el promedio de paginas de los libro AVG
SELECT AVG(PAGINAS) FROM `LIBRO` 

Cual es el total de paginas de los libros SUM
SELECT SUM(PAGINAS) FROM `LIBRO` 

Cantidad de prestamos realizados en la biblioteca COUNT
SELECT COUNT(*) FROM `prestamo` 


Mostrar los libros que más se han prestado
SELECT libro.titulo,count(libro.titulo) FROM libro,ejemplar,prestamo where libro.ID_LIBRO=ejemplar.ID_LIBRO and ejemplar.ID_EJEMPLAR=prestamo.ID_EJEMPLAR group by libro.titulo order by count(libro.titulo) desc 
