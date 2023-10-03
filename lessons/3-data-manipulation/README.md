# 3. Lenguaje de manipulación de datos

## Índice

[1. Inserción](#1-inserción)  
[2. Modificación](#2-modificación)  
[3. Borrado](#3-borrado)

## 1. Inserción

Para insertar todos los valores de una fila (sin nulos):

    INSERT INTO authors
      VALUES(1, 'Antoine de Saint-Exupéry');
    
    INSERT INTO books
      VALUES(1, 'El Principito', 1);

O solo algunos (con nulos):

    INSERT INTO books(id, title)
      VALUES(2, 'Poema de Mío Cid');

## 2. Modificación

Para modificar el valor de un campo según una condición:

    UPDATE books
      SET idAuthor = 1
      WHERE id = 2;

## 3. Borrado

Para borrar filas según una condición:

    DELETE FROM books
      WHERE id = 2;

## Referencias

[Inserción](https://www.w3schools.com/sql/sql_insert.asp)  
[Modificación](https://www.w3schools.com/sql/sql_update.asp)  
[Borrado](https://www.w3schools.com/sql/sql_delete.asp)